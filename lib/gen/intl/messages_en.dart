// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(size) => "Expires in ${size} Days";

  static String m1(size) => "${size} items";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addPageErrorCreateDateEmpty": MessageLookupByLibrary.simpleMessage(
      "Production date cannot be empty",
    ),
    "addPageErrorDateBig": MessageLookupByLibrary.simpleMessage(
      "The shelf life is too long",
    ),
    "addPageErrorDateZero": MessageLookupByLibrary.simpleMessage(
      "The validity period must be greater than 0 days",
    ),
    "addPageErrorNameEmpty": MessageLookupByLibrary.simpleMessage(
      "Name cannot be empty",
    ),
    "addPageErrorOverDateEmpty": MessageLookupByLibrary.simpleMessage(
      "Shelf life cannot be empty",
    ),
    "addPageErrorRDaysOverflow": MessageLookupByLibrary.simpleMessage(
      "Days cannot exceed validity period.",
    ),
    "addPageErrorShelfLifeTooSmall": MessageLookupByLibrary.simpleMessage(
      "Shelf life must be after production date.",
    ),
    "addPageErrorTimeTooLong": MessageLookupByLibrary.simpleMessage(
      "It\'s too long, it\'s impossible",
    ),
    "addPageItemName": MessageLookupByLibrary.simpleMessage("Name"),
    "addPageItemReinder": MessageLookupByLibrary.simpleMessage(
      "Advent Reminder",
    ),
    "addPageRemindHelper": MessageLookupByLibrary.simpleMessage(
      "e.g: you will be reminded 6 days before the expiration date",
    ),
    "addPageTitle": MessageLookupByLibrary.simpleMessage("Add"),
    "allPageExpiresAfterAFewDays": m0,
    "allPageFilterClear": MessageLookupByLibrary.simpleMessage("Clear"),
    "allPageFilterCreateDateEnd": MessageLookupByLibrary.simpleMessage(
      "Production Date - End",
    ),
    "allPageFilterCreateDateStart": MessageLookupByLibrary.simpleMessage(
      "Production Date - Start",
    ),
    "allPageFilterDateError": MessageLookupByLibrary.simpleMessage(
      "The date format is incorrect",
    ),
    "allPageFilterItemName": MessageLookupByLibrary.simpleMessage("Name"),
    "allPageFilterLastDays": MessageLookupByLibrary.simpleMessage(
      "Remaining Days",
    ),
    "allPageFilterOnlyExpiry": MessageLookupByLibrary.simpleMessage(
      "Only Show Expiring Soon",
    ),
    "allPageFilterOverDateEnd": MessageLookupByLibrary.simpleMessage(
      "Shelf Life - End",
    ),
    "allPageFilterOverDateStart": MessageLookupByLibrary.simpleMessage(
      "Shelf Life - Start",
    ),
    "allPageFilterTitle": MessageLookupByLibrary.simpleMessage("Filter"),
    "allPageFilterTypeUnknown": MessageLookupByLibrary.simpleMessage(
      "Not Selected",
    ),
    "allPageHasExpired": MessageLookupByLibrary.simpleMessage("Expired"),
    "allPageItemDelete": MessageLookupByLibrary.simpleMessage("Delete"),
    "allPageItemModify": MessageLookupByLibrary.simpleMessage("Modify"),
    "allPageTitle": MessageLookupByLibrary.simpleMessage("All"),
    "allPageTitleSoonExpiry": MessageLookupByLibrary.simpleMessage(
      "Soon to Expire",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmTheDeletion": MessageLookupByLibrary.simpleMessage(
      "Confirm the deletion?",
    ),
    "createDate": MessageLookupByLibrary.simpleMessage("Production Date"),
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "dateOrDays": MessageLookupByLibrary.simpleMessage("Date or Days"),
    "detailsPageItemCreateDate": MessageLookupByLibrary.simpleMessage(
      "Production Date:",
    ),
    "detailsPageItemName": MessageLookupByLibrary.simpleMessage("Name："),
    "detailsPageItemOverDate": MessageLookupByLibrary.simpleMessage(
      "Shelf Life:",
    ),
    "detailsPageItemReminder": MessageLookupByLibrary.simpleMessage(
      "Advent Reminder:",
    ),
    "detailsPageItemTipsDays": MessageLookupByLibrary.simpleMessage(
      "Valid for a long time:",
    ),
    "detailsPageItemTipsExpiry": MessageLookupByLibrary.simpleMessage(
      "It has expired:",
    ),
    "detailsPageItemType": MessageLookupByLibrary.simpleMessage("Category:"),
    "detailsPageTitle": MessageLookupByLibrary.simpleMessage("Details"),
    "homeSoonExpiryCardLastDays": MessageLookupByLibrary.simpleMessage(
      "Remaining Valid Days: ",
    ),
    "homeSoonExpiryTitle": MessageLookupByLibrary.simpleMessage(
      "Soon to Expire",
    ),
    "homeTitle": MessageLookupByLibrary.simpleMessage("Expiration Assistant"),
    "homeTypeCardRecord": m1,
    "homeTypeTitle": MessageLookupByLibrary.simpleMessage("Category"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "overDate": MessageLookupByLibrary.simpleMessage("Shelf Life"),
    "typeAlcoholicBeverages": MessageLookupByLibrary.simpleMessage(
      "Alcoholic Drinks",
    ),
    "typeBeans": MessageLookupByLibrary.simpleMessage("Beans"),
    "typeBeverages": MessageLookupByLibrary.simpleMessage("Beverages"),
    "typeDairy": MessageLookupByLibrary.simpleMessage("Dairy Products"),
    "typeEggs": MessageLookupByLibrary.simpleMessage("Egg Products"),
    "typeFruits": MessageLookupByLibrary.simpleMessage("Fruits"),
    "typeGrains": MessageLookupByLibrary.simpleMessage("Cereals"),
    "typeMeat": MessageLookupByLibrary.simpleMessage("Meat"),
    "typeMedicalProducts": MessageLookupByLibrary.simpleMessage("Medical"),
    "typeNuts": MessageLookupByLibrary.simpleMessage("Nuts"),
    "typeOilsAndFats": MessageLookupByLibrary.simpleMessage("Oils and Fats"),
    "typeOther": MessageLookupByLibrary.simpleMessage("Other"),
    "typeSeasonings": MessageLookupByLibrary.simpleMessage("Seasonings"),
    "typeSnackFoods": MessageLookupByLibrary.simpleMessage("Snack Foods"),
    "typeTubers": MessageLookupByLibrary.simpleMessage("Starches"),
    "typeVegetables": MessageLookupByLibrary.simpleMessage("Vegetables"),
    "unitDays": MessageLookupByLibrary.simpleMessage("Days"),
  };
}
