import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/ext/date_ext.dart';
import 'package:expiry_mate/page/preview/provider.dart';
import 'package:expiry_mate/widget/page_state_widget.dart';
import 'package:expiry_mate/widget/theme_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemDetailsPage extends StatelessWidget {
  final int id;
  final bool modify;

  const ItemDetailsPage(this.id, this.modify, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '临期详情',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              var watch = ref.watch(itemDetailsProvider(id));
              return IconButton(
                onPressed: watch.hasError
                    ? null
                    : () async {
                        final confirm = await showDialog(
                            context: context,
                            builder: (context) => _ConfirmTheDeletionDialog());
                        if (confirm == true) {
                          var bool = await ref
                              .read(itemDetailsProvider(id).notifier)
                              .delete(id);
                          if (bool && context.mounted) {
                            Navigator.of(context).pop("delete");
                          }
                        }
                      },
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).colorScheme.error,
                ),
              );
            },
          ),
          ThemeButton(),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var watch = ref.watch(itemDetailsProvider(id));
          PageState? state;
          if (watch.isLoading) {
            state = PageState.loading;
          }
          if (watch.hasError) {
            state = PageState.error;
          }
          return PageStateWidget(
            state: state,
            buildChild: () {
              return _Body(watch.requireValue);
            },
          );
        },
      ),
    );
  }
}

class _Body extends ConsumerWidget {
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
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 640,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                item.typeEnum.getIconAsset().path,
                width: 50,
                height: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('名称:         ', style: theme1),
                    Text(item.name!, style: theme2)
                  ],
                ),
                trailing: IconButton(
                    onPressed: () async {
                      var newName = await showDialog(
                        context: context,
                        builder: (context) {
                          return _UniversalInputDialog(
                            '名称',
                            hintText: item.name!,
                          );
                        },
                      );
                      if (newName != null) {
                        ref
                            .read(itemDetailsProvider(item.id!).notifier)
                            .updateName(newName);
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
                    Text('生产日期:  ', style: theme1),
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
                    Text('保质期:     ', style: theme1),
                    Text('${item.overDate?.format()}', style: theme2),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.isExpired() ? '已经过期:' : '有效时长:'),
                    Text("${item.lastDays.abs()}天"),
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
                    Text('临期提醒:  ', style: theme1),
                    Text('${item.reminderDays}天', style: theme2),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () async {
                      final newData = await showDialog(
                        context: context,
                        builder: (context) {
                          return _UniversalInputDialog(
                            '临期提醒',
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
                    Text('分类:', style: theme1),
                    Text(item.typeEnum.getTypeName(), style: theme2)
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
                    icon: Icon(Icons.edit)),
              ),
            ],
          ),
        ),
      ),
    );
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
                '取消',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(textEditingController.text);
              },
              child: Text('确认'),
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
                '取消',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(ctl.selectedItem);
              },
              child: Text('确认'),
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
      title: Text("确认要删除?"),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: Text(
              '取消',
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              '确认',
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
