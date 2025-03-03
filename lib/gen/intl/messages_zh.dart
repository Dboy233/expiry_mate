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

  static String m0(size) => "已录入 ${size}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "createDate": MessageLookupByLibrary.simpleMessage("生产日期"),
    "homeSoonExpiryCardLastDays": MessageLookupByLibrary.simpleMessage(
      "剩余有效天数 : ",
    ),
    "homeSoonExpiryTitle": MessageLookupByLibrary.simpleMessage("即将过期"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("临期助手"),
    "homeTypeCardRecord": m0,
    "homeTypeTitle": MessageLookupByLibrary.simpleMessage("分类"),
    "overDate": MessageLookupByLibrary.simpleMessage("保质期"),
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
  };
}
