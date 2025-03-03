// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Language {
  Language();

  static Language? _current;

  static Language get current {
    assert(
      _current != null,
      'No instance of Language was loaded. Try to initialize the Language delegate before accessing Language.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Language> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Language();
      Language._current = instance;

      return instance;
    });
  }

  static Language of(BuildContext context) {
    final instance = Language.maybeOf(context);
    assert(
      instance != null,
      'No instance of Language present in the widget tree. Did you add Language.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Language? maybeOf(BuildContext context) {
    return Localizations.of<Language>(context, Language);
  }

  /// `临期助手`
  String get homeTitle {
    return Intl.message('临期助手', name: 'homeTitle', desc: '', args: []);
  }

  /// `即将过期`
  String get homeSoonExpiryTitle {
    return Intl.message(
      '即将过期',
      name: 'homeSoonExpiryTitle',
      desc: '',
      args: [],
    );
  }

  /// `分类`
  String get homeTypeTitle {
    return Intl.message('分类', name: 'homeTypeTitle', desc: '', args: []);
  }

  /// `生产日期`
  String get createDate {
    return Intl.message('生产日期', name: 'createDate', desc: '', args: []);
  }

  /// `保质期`
  String get overDate {
    return Intl.message('保质期', name: 'overDate', desc: '', args: []);
  }

  /// `剩余有效天数 : `
  String get homeSoonExpiryCardLastDays {
    return Intl.message(
      '剩余有效天数 : ',
      name: 'homeSoonExpiryCardLastDays',
      desc: '',
      args: [],
    );
  }

  /// `已录入 {size}`
  String homeTypeCardRecord(Object size) {
    return Intl.message(
      '已录入 $size',
      name: 'homeTypeCardRecord',
      desc: '',
      args: [size],
    );
  }

  /// `谷物类`
  String get typeGrains {
    return Intl.message('谷物类', name: 'typeGrains', desc: '', args: []);
  }

  /// `淀粉类`
  String get typeTubers {
    return Intl.message('淀粉类', name: 'typeTubers', desc: '', args: []);
  }

  /// `豆类`
  String get typeBeans {
    return Intl.message('豆类', name: 'typeBeans', desc: '', args: []);
  }

  /// `蔬菜类`
  String get typeVegetables {
    return Intl.message('蔬菜类', name: 'typeVegetables', desc: '', args: []);
  }

  /// `水果类`
  String get typeFruits {
    return Intl.message('水果类', name: 'typeFruits', desc: '', args: []);
  }

  /// `坚果类`
  String get typeNuts {
    return Intl.message('坚果类', name: 'typeNuts', desc: '', args: []);
  }

  /// `肉类`
  String get typeMeat {
    return Intl.message('肉类', name: 'typeMeat', desc: '', args: []);
  }

  /// `乳制品`
  String get typeDairy {
    return Intl.message('乳制品', name: 'typeDairy', desc: '', args: []);
  }

  /// `蛋类及其制品`
  String get typeEggs {
    return Intl.message('蛋类及其制品', name: 'typeEggs', desc: '', args: []);
  }

  /// `休闲食品`
  String get typeSnackFoods {
    return Intl.message('休闲食品', name: 'typeSnackFoods', desc: '', args: []);
  }

  /// `饮料类`
  String get typeBeverages {
    return Intl.message('饮料类', name: 'typeBeverages', desc: '', args: []);
  }

  /// `酒精饮料`
  String get typeAlcoholicBeverages {
    return Intl.message(
      '酒精饮料',
      name: 'typeAlcoholicBeverages',
      desc: '',
      args: [],
    );
  }

  /// `油脂类`
  String get typeOilsAndFats {
    return Intl.message('油脂类', name: 'typeOilsAndFats', desc: '', args: []);
  }

  /// `调味品`
  String get typeSeasonings {
    return Intl.message('调味品', name: 'typeSeasonings', desc: '', args: []);
  }

  /// `医疗药品`
  String get typeMedicalProducts {
    return Intl.message(
      '医疗药品',
      name: 'typeMedicalProducts',
      desc: '',
      args: [],
    );
  }

  /// `其他`
  String get typeOther {
    return Intl.message('其他', name: 'typeOther', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Language> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Language> load(Locale locale) => Language.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
