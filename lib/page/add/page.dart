import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foods_assistant/page/add/provider.dart';
import 'package:foods_assistant/widget/theme_button_widget.dart';
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
            _DebugPrintFood(),
            _FoodName(),
            _CreateDateWidget(),
            _OverDateContainer(),
          ],
        ),
      ),
    );
  }
}

class _FoodName extends HookConsumerWidget {
  const _FoodName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editCtl = useTextEditingController();
    return TextField(
      controller: editCtl,
      onChanged: (value) {
        ref.read(createNewFoodProvider.notifier).updateName(value);
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
            ref.read(createNewFoodProvider.notifier).updateName('');
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
    var data = ref.watch(createNewFoodProvider);
    var createDate = data.requiredData.createDate ?? now;
    String? errorText;
    if (!data.isSuccess) {
      switch (data.code) {
        case resultErrorCodeCreateDateOverflowDays:
          errorText = data.msg;
          break;
      }
    }
    if (createDate != now) {
      editCtl.text = createDate.format(r'Y年m月d日');
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
          ref.read(createNewFoodProvider.notifier).updateCreateDate(date);
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
            border: Border.all(width: 2, color: themeData.colorScheme.outline),
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
                child: Text('日期 or 天数', style: themeData.textTheme.bodyMedium),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                child: _OverDaysWidget(),
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
                  ?.copyWith(color: themeData.colorScheme.inversePrimary),
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
    var data = ref.watch(createNewFoodProvider);
    var choiceDate = data.requiredData.overDate ?? now;
    if (now != choiceDate) {
      //不是默认现在的值就显示
      editCtl.text = choiceDate.format(r'Y年m月d日');
    } else if (now == choiceDate) {
      editCtl.text = '';
    }
    String? errorText;
    if (!data.isSuccess) {
      switch (data.code) {
        case resultErrorCodeOverDate:
        case resultErrorCodeOverDateOverflowDays:
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
          ref.read(createNewFoodProvider.notifier).updateOverDate(date);
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

class _OverDaysWidget extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editCtl = useTextEditingController();
    var data = ref.watch(createNewFoodProvider);
    var days = data.requiredData.safeDays;
    editCtl.text = days != null ? '$days' : '';
    String? errorText;
    if (data.code == resultErrorCodeSafeDays) {
      errorText = '有效期必须大于0天';
    }
    return TextField(
      controller: editCtl,
      onChanged: (value) {
        ref
            .read(createNewFoodProvider.notifier)
            .updateSafeDays(int.tryParse(value));
      },
      onSubmitted: (value) {
        debugPrint('有效期编辑完成 $value');
        ref
            .read(createNewFoodProvider.notifier)
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

class _DebugPrintFood extends ConsumerWidget {
  const _DebugPrintFood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(createNewFoodProvider);
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
    return Container();
  }
}
