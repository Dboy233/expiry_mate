import 'package:expiry_mate/bean/expiry_filter_data.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/ext/date_ext.dart';
import 'package:expiry_mate/gen/l10n.dart';
import 'package:expiry_mate/page/all/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

///筛选弹窗内容
class FilterContentWidget extends HookConsumerWidget {
  final GlobalKey<State<StatefulWidget>> formKey;
  final ExpiryType? lockType;

  const FilterContentWidget(this.formKey, this.lockType, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///这里使用read不用watch，只对筛选数据修改，不通知也不相应变化。
    ///所以父级widget必须有一个是watch此provider，
    ///否则改变后provider由于没有被订阅而被销毁其数据也被清空。
    var filterData = ref.read(expiryFilterProvider(lockType));

    ///设置临时状态管理
    final nameCtl = useTextEditingController();
    final createDateFirstCtl = useTextEditingController();
    final createDateLastCtl = useTextEditingController();
    final overDateFirstCtl = useTextEditingController();
    final overDateLastCtl = useTextEditingController();
    final lastDaysCtl = useTextEditingController();
    final onlyIsExpiryWitch = useState<bool>(filterData.isExpiry ?? false);
    final clearState = useState(0); //清空state，用于刷新当前widget触发rebuild

    ///设置初始值
    nameCtl.text = filterData.name ?? '';
    createDateFirstCtl.text = filterData.createDateStart?.format() ?? '';
    createDateLastCtl.text = filterData.createDateEnd?.format() ?? '';
    overDateFirstCtl.text = filterData.overDateStart?.format() ?? '';
    overDateLastCtl.text = filterData.overDateEnd?.format() ?? '';
    lastDaysCtl.text = filterData.lastDays?.toString() ?? '';
    if (lockType != null) {
      filterData.type = lockType!.index;
    }
    final initType = (filterData.type ?? -1) + 1;

    return SizedBox(
      height: double.maxFinite,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 100),
        scrollDirection: Axis.vertical,
        child: Form(
          //没用到
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Language.current.allPageFilterTitle,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextButton(
                        onPressed: () {
                          filterData.clear();
                          clearState.value += 1;
                        },
                        child: Text(Language.current.allPageFilterClear))
                  ],
                ),
              ),
              Divider(height: 26, color: Colors.transparent),
              Container(
                height: 52,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.6),
                    width: onlyIsExpiryWitch.value ? 2.5 : 1.5,
                  ),
                ),
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Language.current.allPageFilterOnlyExpiry,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: onlyIsExpiryWitch.value
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                    Switch(
                      value: onlyIsExpiryWitch.value,
                      onChanged: (value) {
                        onlyIsExpiryWitch.value = value;
                        filterData.isExpiry = value;
                      },
                    )
                  ],
                ),
              ),
              Divider(height: 26, color: Colors.transparent),
              TextFormField(
                controller: nameCtl,
                decoration: InputDecoration(
                    labelText: Language.current.allPageFilterItemName,
                    enabled: !onlyIsExpiryWitch.value,
                    counterText: '',
                    suffixIcon: IconButton(
                      onPressed: () {
                        nameCtl.clear();
                        filterData.name = null;
                      },
                      icon: Icon(Icons.clear),
                    )),
                maxLength: 10,
                onChanged: (value) {
                  filterData.name = value;
                },
              ),
              Divider(height: 26, color: Colors.transparent),
              _getCreateDateAndOverDateFilterInput(
                context,
                ref,
                createDateFirstCtl,
                createDateLastCtl,
                isSetCreateDateField: true,
                enable: !onlyIsExpiryWitch.value,
              ),
              Divider(height: 8, color: Colors.transparent),
              _getCreateDateAndOverDateFilterInput(
                context,
                ref,
                overDateFirstCtl,
                overDateLastCtl,
                isSetOverDateField: true,
                enable: !onlyIsExpiryWitch.value,
              ),
              Divider(height: 8, color: Colors.transparent),
              TextFormField(
                controller: lastDaysCtl,
                enabled: !onlyIsExpiryWitch.value,
                decoration: InputDecoration(
                    labelText: Language.current.allPageFilterLastDays,
                    suffixText: Language.current.unitDays,
                    suffixIcon: IconButton(
                      onPressed: () {
                        lastDaysCtl.clear();
                        filterData.lastDays = null;
                      },
                      icon: Icon(Icons.clear),
                    )),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  filterData.lastDays = int.tryParse(value);
                },
                validator: (value) {
                  //不校验了，烦 ＞﹏＜
                  return null;
                },
              ),
              Divider(height: 26, color: Colors.transparent),
              if (lockType == null) //没有锁定类型的情况下才可以修改类型
                AbsorbPointer(
                  absorbing: onlyIsExpiryWitch.value,
                  child: Container(
                    width: double.maxFinite,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      border: Border.all(
                        color: onlyIsExpiryWitch.value
                            ? Theme.of(context)
                                .disabledColor
                                .withValues(alpha: 0.2)
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withValues(alpha: 0.6),
                        width: 1.5,
                      ),
                    ),
                    child: CupertinoPicker(
                        itemExtent: 50,
                        diameterRatio: 1,
                        scrollController:
                            FixedExtentScrollController(initialItem: initType),
                        selectionOverlay: Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              color: onlyIsExpiryWitch.value
                                  ? Theme.of(context)
                                      .disabledColor
                                      .withValues(alpha: 0.1)
                                  : Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withValues(alpha: 0.2)),
                        ),
                        onSelectedItemChanged: (value) {
                          if (value == 0) {
                            filterData.type = null;
                          } else {
                            filterData.type = value - 1;
                          }
                        },
                        children: [
                          Center(
                            child: Text(
                              Language.current.allPageFilterTypeUnknown,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          ..._createTypeItem(context)
                        ]),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  ///获取创建日期和结束日期筛选输入组件
  Widget _getCreateDateAndOverDateFilterInput(
    BuildContext context,
    WidgetRef ref,
    TextEditingController firstCtl,
    TextEditingController lastCtl, {
    bool isSetCreateDateField = false,
    bool isSetOverDateField = false,
    bool enable = true,
  }) {
    //由于子Widget中存在线性布局Flex，Row，而Flex，row中的子布局TextFormField需要一个明确的width
    //所以需要使用layoutBuilder。否者会报错。并且需要用SizeBox指明width的值
    return LayoutBuilder(
      builder: (context, constraints) {
        var widthConstraints = constraints.widthConstraints();
        return SizedBox(
          width: widthConstraints.maxWidth,
          height: 70,
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: firstCtl,
                  enabled: enable,
                  focusNode: FocusNode(
                    onKeyEvent: (node, event) {
                      if (event.physicalKey == PhysicalKeyboardKey.tab) {
                        //物理按键tab
                        //弹出选择日期
                        if (isSetCreateDateField) {
                          _showDatePicker(context, ref, firstCtl,
                              isCreateDateStart: true);
                        } else {
                          _showDatePicker(context, ref, firstCtl,
                              isOverDateStart: true);
                        }

                        return KeyEventResult.handled;
                      }
                      return KeyEventResult.ignored;
                    },
                  ),
                  onTap: () {
                    //点击对话框获取焦点，弹出选择日期
                    if (isSetCreateDateField) {
                      _showDatePicker(context, ref, firstCtl,
                          isCreateDateStart: true);
                    } else {
                      _showDatePicker(context, ref, firstCtl,
                          isOverDateStart: true);
                    }
                  },
                  decoration: InputDecoration(
                      labelText: isSetCreateDateField
                          ? Language.current.allPageFilterCreateDateStart
                          : Language.current.allPageFilterOverDateStart,
                      suffixIcon: IconButton(
                        onPressed: () {
                          firstCtl.text = '';
                          var filterData =
                              ref.read(expiryFilterProvider(lockType));
                          if (isSetCreateDateField) {
                            filterData.createDateStart = null;
                          } else {
                            filterData.overDateStart = null;
                          }
                        },
                        icon: Icon(Icons.clear),
                      )),
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return null;
                    }
                    if (value != null &&
                        DateFormat.yMd().tryParse(value) == null) {
                      return Language.current.allPageFilterDateError;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                  width: 16,
                  height: 52,
                  child: Divider(
                    height: 2,
                    color: Theme.of(context).colorScheme.primary,
                    endIndent: 3,
                    indent: 3,
                  )),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: lastCtl,
                  enabled: enable,
                  focusNode: FocusNode(
                    onKeyEvent: (node, event) {
                      if (event.physicalKey == PhysicalKeyboardKey.tab) {
                        //物理按键tab
                        //弹出选择日期
                        if (isSetCreateDateField) {
                          _showDatePicker(context, ref, lastCtl,
                              isCreateDateEnd: true);
                        } else {
                          _showDatePicker(context, ref, lastCtl,
                              isOverDateEnd: true);
                        }
                        return KeyEventResult.handled;
                      }
                      return KeyEventResult.ignored;
                    },
                  ),
                  onTap: () {
                    //点击对话框获取焦点，弹出选择日期
                    if (isSetCreateDateField) {
                      _showDatePicker(context, ref, lastCtl,
                          isCreateDateEnd: true);
                    } else {
                      _showDatePicker(context, ref, lastCtl,
                          isOverDateEnd: true);
                    }
                  },
                  decoration: InputDecoration(
                      labelText: isSetCreateDateField
                          ? Language.current.allPageFilterCreateDateEnd
                          : Language.current.allPageFilterOverDateEnd,
                      suffixIcon: IconButton(
                        onPressed: () {
                          lastCtl.text = '';
                          var filterData =
                              ref.read(expiryFilterProvider(lockType));
                          if (isSetCreateDateField) {
                            filterData.createDateEnd = null;
                          } else {
                            filterData.overDateEnd = null;
                          }
                        },
                        icon: Icon(Icons.clear),
                      )),
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return null;
                    }
                    if (value != null &&
                        DateFormat.yMd().tryParse(value) == null) {
                      return Language.current.allPageFilterDateError;
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  ///显示时间选择器
  void _showDatePicker(
    BuildContext context,
    WidgetRef ref,
    TextEditingController controller, {
    ///判断范围，start是开始选择开始时间，end是选择结束时间
    bool isCreateDateStart = false,
    bool isCreateDateEnd = false,
    bool isOverDateStart = false,
    bool isOverDateEnd = false,
  }) async {
    final now = DateTime.now();
    DateTime filterDateStart = DateTime(now.year - 5);
    DateTime filterDateEnd = DateTime(now.year + 5);

    //NOTE: 判断逻辑很复杂，不要轻易弄懂。

    // filterDateStart<=selectedDate<=filterDateEnd
    DateTime selectedDate;
    var filterData = ref.read(expiryFilterProvider(lockType));
    if (isCreateDateStart) {
      //filterDateEnd <= now
      filterDateStart = DateTime(now.year - 5);
      //filterDateEnd <= createDateStart<=now
      filterDateEnd = filterData.createDateEnd ?? now;
      selectedDate = filterData.createDateStart ?? filterDateEnd;
    } else if (isCreateDateEnd) {
      //filterDateStart >= createDateStart
      filterDateStart = filterData.createDateStart ?? filterDateStart;
      //filterDateEnd < now
      filterDateEnd = now;
      selectedDate = filterData.createDateEnd ?? now;
    } else if (isOverDateStart) {
      //设置保质期开始时间；
      //   createDateStart <= filterDateStart
      filterDateStart = filterData.createDateStart ?? filterDateStart;
      //  filterDateEnd<= overDateEnd
      filterDateEnd = filterData.overDateEnd ?? filterDateEnd;
      //初始时间就是用户选择的时间，如果没有使用firstDate
      selectedDate = filterData.overDateStart ?? filterData.overDateEnd ?? now;
    } else {
      //createDateStart<=overDateStart<=filterDateStart
      filterDateStart = filterData.overDateStart ??
          filterData.createDateStart ??
          filterDateStart;
      //filterDateEnd
      // filterDateEnd =
      selectedDate = filterData.overDateEnd ?? filterData.overDateStart ?? now;
    }
    final date = await showDatePicker(
      context: context,
      firstDate: filterDateStart,
      lastDate: filterDateEnd,
      initialDate: selectedDate,
      // currentDate: now,
    );

    if (date == null) {
      return;
    }

    //修改过滤数据
    if (isCreateDateStart) {
      filterData.createDateStart = date;
    } else if (isCreateDateEnd) {
      filterData.createDateEnd = date;
    } else if (isOverDateStart) {
      filterData.overDateStart = date;
    } else {
      filterData.overDateEnd = date;
    }
    controller.text = date.format();
  }
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
