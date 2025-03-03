// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static String m0(size) => "${size}天后过期";

  static String m1(size) => "已录入 ${size}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addPageErrorCreateDateEmpty": MessageLookupByLibrary.simpleMessage(
      "生产日期不能为空",
    ),
    "addPageErrorDateBig": MessageLookupByLibrary.simpleMessage("你看看这保质期太久了吧"),
    "addPageErrorDateZero": MessageLookupByLibrary.simpleMessage("有效期必须大于0天"),
    "addPageErrorNameEmpty": MessageLookupByLibrary.simpleMessage("名称不能为空"),
    "addPageErrorOverDateEmpty": MessageLookupByLibrary.simpleMessage(
      "保质期不能为空",
    ),
    "addPageErrorRDaysOverflow": MessageLookupByLibrary.simpleMessage(
      "天数不能超过有效期范围",
    ),
    "addPageErrorShelfLifeTooSmall": MessageLookupByLibrary.simpleMessage(
      "保质期必须大于生产日期",
    ),
    "addPageErrorTimeTooLong": MessageLookupByLibrary.simpleMessage(
      "咱自己都活不了那么久",
    ),
    "addPageItemName": MessageLookupByLibrary.simpleMessage("名称"),
    "addPageItemReinder": MessageLookupByLibrary.simpleMessage("临期提醒"),
    "addPageRemindHelper": MessageLookupByLibrary.simpleMessage(
      "例如：临期前6天提醒你处理",
    ),
    "addPageTitle": MessageLookupByLibrary.simpleMessage("添加"),
    "allPageExpiresAfterAFewDays": m0,
    "allPageFilterClear": MessageLookupByLibrary.simpleMessage("清空"),
    "allPageFilterCreateDateEnd": MessageLookupByLibrary.simpleMessage(
      "生产日期-结束",
    ),
    "allPageFilterCreateDateStart": MessageLookupByLibrary.simpleMessage(
      "生产日期-开始",
    ),
    "allPageFilterDateError": MessageLookupByLibrary.simpleMessage("请输入正确日期格式"),
    "allPageFilterItemName": MessageLookupByLibrary.simpleMessage("名称"),
    "allPageFilterLastDays": MessageLookupByLibrary.simpleMessage("剩余天数"),
    "allPageFilterOnlyExpiry": MessageLookupByLibrary.simpleMessage("只看临期"),
    "allPageFilterOverDateEnd": MessageLookupByLibrary.simpleMessage("保质期-结束"),
    "allPageFilterOverDateStart": MessageLookupByLibrary.simpleMessage(
      "保质期-开始",
    ),
    "allPageFilterTitle": MessageLookupByLibrary.simpleMessage("筛选"),
    "allPageFilterTypeUnknown": MessageLookupByLibrary.simpleMessage("未选择"),
    "allPageHasExpired": MessageLookupByLibrary.simpleMessage("已过期"),
    "allPageItemDelete": MessageLookupByLibrary.simpleMessage("删除"),
    "allPageItemModify": MessageLookupByLibrary.simpleMessage("修改"),
    "allPageTitle": MessageLookupByLibrary.simpleMessage("全部"),
    "allPageTitleSoonExpiry": MessageLookupByLibrary.simpleMessage("即将过期"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "confirm": MessageLookupByLibrary.simpleMessage("确认"),
    "confirmTheDeletion": MessageLookupByLibrary.simpleMessage("确认要删除?"),
    "createDate": MessageLookupByLibrary.simpleMessage("生产日期"),
    "date": MessageLookupByLibrary.simpleMessage("日期"),
    "dateOrDays": MessageLookupByLibrary.simpleMessage("日期 or 天数"),
    "detailsPageItemCreateDate": MessageLookupByLibrary.simpleMessage("生产日期："),
    "detailsPageItemName": MessageLookupByLibrary.simpleMessage("名称："),
    "detailsPageItemOverDate": MessageLookupByLibrary.simpleMessage("保质期："),
    "detailsPageItemReminder": MessageLookupByLibrary.simpleMessage("临期提醒："),
    "detailsPageItemTipsDays": MessageLookupByLibrary.simpleMessage("有效时长："),
    "detailsPageItemTipsExpiry": MessageLookupByLibrary.simpleMessage("已经过期："),
    "detailsPageItemType": MessageLookupByLibrary.simpleMessage("分类："),
    "detailsPageTitle": MessageLookupByLibrary.simpleMessage("临期详情"),
    "homeSoonExpiryCardLastDays": MessageLookupByLibrary.simpleMessage(
      "剩余有效天数 : ",
    ),
    "homeSoonExpiryTitle": MessageLookupByLibrary.simpleMessage("即将过期"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("临期助手"),
    "homeTypeCardRecord": m1,
    "homeTypeTitle": MessageLookupByLibrary.simpleMessage("分类"),
    "language": MessageLookupByLibrary.simpleMessage("语言"),
    "overDate": MessageLookupByLibrary.simpleMessage("保质期"),
    "statePageEmpty": MessageLookupByLibrary.simpleMessage("空空如也"),
    "statePageRetry": MessageLookupByLibrary.simpleMessage("出错了,点击重试"),
    "typeAlcoholicBeverages": MessageLookupByLibrary.simpleMessage("酒精饮料"),
    "typeBeans": MessageLookupByLibrary.simpleMessage("豆类"),
    "typeBeverages": MessageLookupByLibrary.simpleMessage("饮料类"),
    "typeDairy": MessageLookupByLibrary.simpleMessage("乳制品"),
    "typeEggs": MessageLookupByLibrary.simpleMessage("蛋类及其制品"),
    "typeFruits": MessageLookupByLibrary.simpleMessage("水果类"),
    "typeGrains": MessageLookupByLibrary.simpleMessage("谷物类"),
    "typeMeat": MessageLookupByLibrary.simpleMessage("肉类"),
    "typeMedicalProducts": MessageLookupByLibrary.simpleMessage("医疗药品"),
    "typeNuts": MessageLookupByLibrary.simpleMessage("坚果类"),
    "typeOilsAndFats": MessageLookupByLibrary.simpleMessage("油脂类"),
    "typeOther": MessageLookupByLibrary.simpleMessage("其他"),
    "typeSeasonings": MessageLookupByLibrary.simpleMessage("调味品"),
    "typeSnackFoods": MessageLookupByLibrary.simpleMessage("休闲食品"),
    "typeTubers": MessageLookupByLibrary.simpleMessage("淀粉类"),
    "typeVegetables": MessageLookupByLibrary.simpleMessage("蔬菜类"),
    "unitDays": MessageLookupByLibrary.simpleMessage("天"),
  };
}
