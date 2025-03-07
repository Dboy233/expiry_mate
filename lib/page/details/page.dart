import 'dart:io';

import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/ext/date_ext.dart';
import 'package:expiry_mate/gen/assets.gen.dart';
import 'package:expiry_mate/gen/l10n.dart';
import 'package:expiry_mate/page/camera/page.dart';
import 'package:expiry_mate/page/details/provider.dart';
import 'package:expiry_mate/widget/page_state_widget.dart';
import 'package:expiry_mate/widget/theme_button_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemDetailsPage extends ConsumerWidget {
  final int id;
  final bool modify;

  const ItemDetailsPage(this.id, this.modify, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(itemDetailsProvider(id));
    PageState? state;
    if (watch.isLoading) {
      state = PageState.loading;
    }
    if (watch.hasError) {
      state = PageState.error;
    }
    return Scaffold(
      body: PageStateWidget(
        state: state,
        buildChild: () {
          return _Body(watch.requireValue);
        },
      ),
    );
  }
}

class _Body extends HookConsumerWidget {
  final ExpiryItem item;

  const _Body(this.item, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme1 = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.bold);
    final theme2 = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(color: Theme.of(context).colorScheme.primary);
    Color beginColor = Theme.of(context).colorScheme.onInverseSurface;
    Color endColor = Theme.of(context).colorScheme.inverseSurface;
    final appBarDynamicDisplayColor = useState<Color?>(beginColor);
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          var offset = notification.metrics.pixels;
          var minHeight = 64;
          var maxHeight = 152;
          //计算offset在 maxHeight和minHeight 经过是的百分比
          var percent = offset / (maxHeight - minHeight);
          if (percent < 0) {
            percent = 0;
          }
          //通过百分比来动态得出Appbar内容显示的颜色。
          appBarDynamicDisplayColor.value =
              Color.lerp(beginColor, endColor, percent);
        }
        return false;
      },
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar.large(
              toolbarHeight: 64,
              expandedHeight: 152,
              leading: BackButton(
                color: appBarDynamicDisplayColor.value,
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 40),
                    Text(item.name!,
                        style: theme1?.copyWith(
                            color: appBarDynamicDisplayColor.value)),
                    IconButton(
                      onPressed: () async {
                        await _modifyName(context, ref);
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 20,
                        color: appBarDynamicDisplayColor.value,
                      ),
                    ),
                  ],
                ),
                background: Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          ///show img
                        },
                        child: item.coverPath != null
                            ? Image.file(
                                File(item.coverPath!),
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                Assets.images.imgCoverDef.path,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () async {
                            await _modifyCover(context, ref);
                          },
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            color: appBarDynamicDisplayColor.value,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                //删除按钮
                IconButton(
                  onPressed: () async {
                    final confirm = await showDialog(
                        context: context,
                        builder: (context) => _ConfirmTheDeletionDialog());
                    if (confirm == true) {
                      var bool = await ref
                          .read(itemDetailsProvider(item.id!).notifier)
                          .delete(item.id!);
                      if (bool && context.mounted) {
                        Navigator.of(context).pop("delete");
                      }
                    }
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                //修改主题按钮
                ThemeButton(),
              ],
            )
          ];
        },
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 640),
            child: Column(children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Language.current.detailsPageItemCreateDate,
                        style: theme1),
                    Text('${item.createDate?.format()}', style: theme2)
                  ],
                ),
                trailing: IconButton(
                    onPressed: () async {
                      final now = DateTime.now();
                      DateTime? dateTime = await showDatePicker(
                        context: context,
                        firstDate: DateTime(now.year - 5),
                        lastDate: DateTime(now.year + 5),
                        initialDate: item.createDate,
                      );
                      if (!context.mounted) {
                        return;
                      }
                      if (dateTime != null) {
                        var read =
                            ref.read(itemDetailsProvider(item.id!).notifier);
                        var errorMsg = read.canUpdateCreateDate(dateTime);
                        if (errorMsg != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(errorMsg), showCloseIcon: true),
                          );
                        } else {
                          read.updateCreateDate(dateTime);
                        }
                      }
                    },
                    icon: Icon(Icons.edit)),
              ),
              Divider(
                height: 1,
                indent: 16,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Language.current.detailsPageItemOverDate,
                        style: theme1),
                    Text('${item.overDate?.format()}', style: theme2),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.isExpired()
                        ? Language.current.detailsPageItemTipsExpiry
                        : Language.current.detailsPageItemTipsDays),
                    Text("${item.lastDays.abs()} ${Language.current.unitDays}"),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () async {
                      final now = DateTime.now();
                      DateTime? dateTime = await showDatePicker(
                        context: context,
                        firstDate: DateTime(now.year - 5),
                        lastDate: DateTime(now.year + 5),
                        initialDate: item.overDate,
                      );
                      if (!context.mounted) {
                        return;
                      }
                      if (dateTime != null) {
                        var read =
                            ref.read(itemDetailsProvider(item.id!).notifier);
                        var errorMsg = read.canUpdateOverDate(dateTime);
                        if (errorMsg != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(errorMsg), showCloseIcon: true),
                          );
                        } else {
                          read.updateOverDate(dateTime);
                        }
                      }
                    },
                    icon: Icon(Icons.edit)),
              ),
              Divider(
                height: 1,
                indent: 16,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Language.current.detailsPageItemReminder,
                        style: theme1),
                    Text('${item.reminderDays} ${Language.current.unitDays}',
                        style: theme2),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () async {
                      final newData = await showDialog(
                        context: context,
                        builder: (context) {
                          return _UniversalInputDialog(
                            Language.current.detailsPageItemReminder,
                            hintText: item.reminderDays.toString(),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          );
                        },
                      );
                      if (newData != null && context.mounted) {
                        var read =
                            ref.read(itemDetailsProvider(item.id!).notifier);
                        var errorMsg =
                            read.canUpdateRemindDays(int.parse(newData));
                        if (errorMsg != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(errorMsg), showCloseIcon: true),
                          );
                        } else {
                          read.updateRemindDays(int.parse(newData));
                        }
                      }
                    },
                    icon: Icon(Icons.edit)),
              ),
              Divider(
                height: 1,
                indent: 16,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Language.current.detailsPageItemType, style: theme1),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          item.typeEnum.getIconAsset().path,
                          width: 20,
                          height: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        SizedBox(width: 8),
                        Text(item.typeEnum.getTypeName(), style: theme2),
                      ],
                    )
                  ],
                ),
                trailing: IconButton(
                  onPressed: () async {
                    final newData = await showDialog(
                      context: context,
                      builder: (context) => _ChoiceTypeDialog(item.typeEnum),
                    );
                    if (newData != null && context.mounted) {
                      var read =
                          ref.read(itemDetailsProvider(item.id!).notifier);
                      read.updateType(newData);
                    }
                  },
                  icon: Icon(Icons.edit),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  ///修改名称
  Future<void> _modifyName(BuildContext context, WidgetRef ref) async {
    var newName = await showDialog(
      context: context,
      builder: (context) {
        return _UniversalInputDialog(
          Language.current.detailsPageItemName,
          hintText: item.name!,
        );
      },
    );
    if (newName != null) {
      ref.read(itemDetailsProvider(item.id!).notifier).updateName(newName);
    }
  }

  ///修改封面图片
  Future<void> _modifyCover(BuildContext context, WidgetRef ref) async {
    String? newFilePath;
    if (Platform.isAndroid || Platform.isIOS) {
      newFilePath = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CameraPage(),
          ));
    } else {
      newFilePath = await _desktopSelectImage();
    }
    if (newFilePath != null) {
      String? errorMsg = await ref
          .read(itemDetailsProvider(item.id!).notifier)
          .updateCover(newFilePath);
      if (errorMsg != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            Language.current.errorCoverSetFailed,
          ),
          showCloseIcon: true,
        ));
      }
    }
  }
}

class _UniversalInputDialog extends HookWidget {
  final String title;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const _UniversalInputDialog(this.title,
      {super.key, this.hintText, this.keyboardType, this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    var textEditingController = useTextEditingController();

    return SimpleDialog(
      title: Text(title),
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
      children: [
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: IconButton(
              onPressed: () {
                textEditingController.text = '';
              },
              icon: Icon(Icons.clear),
            ),
          ),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 8,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text(
                Language.current.cancel,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(textEditingController.text);
              },
              child: Text(Language.current.confirm),
            ),
          ],
        )
      ],
    );
  }
}

class _ChoiceTypeDialog extends HookWidget {
  final ExpiryType initType;

  const _ChoiceTypeDialog(this.initType, {super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = useFixedExtentScrollController(initialItem: initType.index);
    return SimpleDialog(
      title: Text('选择类型'),
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
      children: [
        SizedBox(
          height: 150,
          child: CupertinoPicker(
            itemExtent: 50,
            diameterRatio: 1,
            scrollController: ctl,
            selectionOverlay: Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.2)),
            ),
            onSelectedItemChanged: null,
            children: _createTypeItem(context),
          ),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 8,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text(
                Language.current.cancel,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(ctl.selectedItem);
              },
              child: Text(Language.current.confirm),
            ),
          ],
        )
      ],
    );
  }

  List<Widget> _createTypeItem(BuildContext context) {
    return ExpiryType.values.map(
      (e) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            Image.asset(
              e.getIconAsset().path,
              color: Theme.of(context).iconTheme.color,
              height: 24,
              width: 24,
            ),
            Text(
              e.getTypeName(),
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        );
      },
    ).toList();
  }
}

class _ConfirmTheDeletionDialog extends StatelessWidget {
  const _ConfirmTheDeletionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Language.current.confirmTheDeletion),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: Text(
              Language.current.cancel,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              Language.current.confirm,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

///桌面平台选择图片
Future<String?> _desktopSelectImage() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'jpeg', 'png'],
  );
  if (result != null && result.count > 0) {
    var selectedImage = result.files[0];
    return selectedImage.path;
  }
  return null;
}
