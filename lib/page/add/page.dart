import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/ext/date_ext.dart';
import 'package:expiry_mate/page/add/provider.dart';
import 'package:expiry_mate/widget/theme_button_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          '添加食品',
        ),
        actions: [ThemeButton()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            // _DebugPrintFood(),
            _ItemNameWidget(),
            _CreateDateWidget(),
            _OverDateContainer(),
            _RemindDaysWidget(),
            _TypeWidget(),
          ],
        ),
      ),
      floatingActionButton: _CreateWidget(),
    );
  }
}

class _CreateWidget extends ConsumerWidget {
  const _CreateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      shape: CircleBorder(),
      onPressed: () async {
        final result = await ref.read(createNewItemProvider.notifier).create();
        if (!context.mounted) {
          return;
        }
        if (result.isSuccess) {
          Navigator.of(context).pop();
        } else {
          _showError(context, result.msg);
        }
      },
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
    );
  }

  _showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      showCloseIcon: true,
      hitTestBehavior: HitTestBehavior.translucent,
      content: Text(msg,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.errorContainer)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      backgroundColor: Theme.of(context).colorScheme.error,
    ));
  }
}

class _ItemNameWidget extends HookConsumerWidget {
  const _ItemNameWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editCtl = useTextEditingController();
    return TextField(
      controller: editCtl,
      onChanged: (value) {
        ref.read(createNewItemProvider.notifier).updateName(value);
      },
      decoration: InputDecoration(
        counterText: '',
        labelText: '名称',
        suffixIcon: IconButton(
          icon: Icon(
            Icons.clear,
          ),
          onPressed: () {
            editCtl.clear();
            ref.read(createNewItemProvider.notifier).updateName('');
          },
        ),
      ),
      maxLength: 10,
      enableSuggestions: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.start,
    );
  }
}

class _CreateDateWidget extends HookConsumerWidget {
  const _CreateDateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editCtl = useTextEditingController();
    var now = DateTime.now();
    var data = ref.watch(createNewItemProvider);
    var createDate = data.requiredData.createDate ?? now;
    String? errorText;
    if (!data.isSuccess) {
      switch (data.code) {
        case errorCodeCreateDateOverflowDays:
          errorText = data.msg;
          break;
      }
    }
    if (createDate != now) {
      editCtl.text = createDate.formatCn();
    }
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).focusedChild?.unfocus();
        var date = await showDatePicker(
          context: context,
          firstDate: now.subtract(Duration(days: 9999)),
          lastDate: now,
          initialDate: createDate,
          currentDate: now,
        );
        if (date != null) {
          ref.read(createNewItemProvider.notifier).updateCreateDate(date);
        }
      },
      child: AbsorbPointer(
        child: TextField(
          controller: editCtl,
          decoration: InputDecoration(
            labelText: '生产日期',
            errorText: errorText,
            filled: false,
            suffixIcon: Icon(Icons.date_range),
          ),
          keyboardType: TextInputType.text,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class _OverDateContainer extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeData = Theme.of(context);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: themeData.colorScheme.primary.withValues(alpha: 0.6)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 24, right: 8),
                child: _OverDateWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('日期 or 天数',
                    style: themeData.textTheme.bodyMedium
                        ?.copyWith(color: themeData.colorScheme.primary.withValues(alpha: 0.6))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                child: _SafeDaysWidget(),
              ),
            ],
          ),
        ),
        Container(
          color: themeData.colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              '保质期',
              style: themeData.textTheme.titleSmall
                  ?.copyWith(color: themeData.colorScheme.primary.withValues(alpha: 0.6)),
            ),
          ),
        )
      ],
    );
  }
}

class _OverDateWidget extends HookConsumerWidget {
  const _OverDateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editCtl = useTextEditingController();
    var now = DateTime.now();
    var data = ref.watch(createNewItemProvider);
    var choiceDate = data.requiredData.overDate ?? now;
    if (now != choiceDate) {
      //不是默认现在的值就显示
      editCtl.text = choiceDate.formatCn();
    } else if (now == choiceDate) {
      editCtl.text = '';
    }
    String? errorText;
    if (!data.isSuccess) {
      switch (data.code) {
        case errorCodeOverDate:
        case errorCodeOverDateOverflowDays:
          errorText = data.msg;
          break;
      }
    }
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).focusedChild?.unfocus();
        var date = await showDatePicker(
          context: context,
          firstDate: now.subtract(Duration(days: 1)),
          lastDate: now.add(Duration(days: 9999)),
          initialDate: choiceDate,
          currentDate: now,
        );
        if (date != null) {
          ref.read(createNewItemProvider.notifier).updateOverDate(date);
        }
      },
      child: AbsorbPointer(
        child: TextField(
          controller: editCtl,
          decoration: InputDecoration(
            labelText: '日期',
            filled: false,
            suffixIcon: Icon(Icons.date_range),
            errorText: errorText,
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class _SafeDaysWidget extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editCtl = useTextEditingController();
    var data = ref.watch(createNewItemProvider);
    var days = data.requiredData.safeDays;
    editCtl.text = days != null ? '$days' : '';
    String? errorText;
    if (data.code == errorCodeSafeDays) {
      errorText = '有效期必须大于0天';
    }
    return TextField(
      controller: editCtl,
      onChanged: (value) {
        ref
            .read(createNewItemProvider.notifier)
            .updateSafeDays(int.tryParse(value));
      },
      onSubmitted: (value) {
        ref
            .read(createNewItemProvider.notifier)
            .updateSafeDays(int.tryParse(value) ?? 0);
      },
      decoration: InputDecoration(
        labelText: '天数',
        filled: false,
        suffixIcon: Icon(Icons.access_time_rounded),
        suffixText: '天',
        errorText: errorText,
      ),
      maxLength: 4,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.start,
    );
  }
}

class _RemindDaysWidget extends HookConsumerWidget {
  const _RemindDaysWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editCtl = useTextEditingController();
    var data = ref.watch(createNewItemProvider);
    String? errorText;
    if (!data.isSuccess) {
      switch (data.code) {
        case errorCodeRDaysOverFlowDays:
          errorText = data.msg;
          break;
      }
      // //NOTE: 发生错误修正值
      editCtl.text = data.requiredData.reminderDays.toString();
    }
    return TextField(
      controller: editCtl,
      onChanged: (value) {
        ref
            .read(createNewItemProvider.notifier)
            .updateRemindDays(int.tryParse(value) ?? 0);
      },
      decoration: InputDecoration(
        labelText: '临期提醒',
        helperText: '例如:临期前6天提醒你处理',
        suffixText: '天',
        errorText: errorText,
        suffixIcon: IconButton(
          icon: Icon(
            Icons.access_time_rounded,
          ),
          onPressed: () {
            //可以做成日期选择
          },
        ),
      ),
      maxLength: 2,
      enableSuggestions: true,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.start,
    );
  }
}

class _DebugPrintFood extends ConsumerWidget {
  const _DebugPrintFood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(createNewItemProvider);
    return Center(
      child: Text('${watch.data?.toJson()}',
          style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class _TypeWidget extends ConsumerWidget {
  const _TypeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //todo
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.6),
          width: 1.5,
        ),
      ),
      child: CupertinoPicker(
        itemExtent: 50,
        diameterRatio: 1,
        onSelectedItemChanged: (value) {
          ref.read(createNewItemProvider.notifier).updateType(value);
        },
        selectionOverlay: Container(
          margin: EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withValues(alpha: 0.2)),
        ),
        children: _createItem(context),
      ),
    );
  }

  List<Widget> _createItem(BuildContext context) {
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
