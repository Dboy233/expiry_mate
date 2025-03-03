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

  /// `语言`
  String get language {
    return Intl.message('语言', name: 'language', desc: '', args: []);
  }

  /// `全部`
  String get allPageTitle {
    return Intl.message('全部', name: 'allPageTitle', desc: '', args: []);
  }

  /// `即将过期`
  String get allPageTitleSoonExpiry {
    return Intl.message(
      '即将过期',
      name: 'allPageTitleSoonExpiry',
      desc: '',
      args: [],
    );
  }

  /// `已过期`
  String get allPageHasExpired {
    return Intl.message('已过期', name: 'allPageHasExpired', desc: '', args: []);
  }

  /// `{size}天后过期`
  String allPageExpiresAfterAFewDays(Object size) {
    return Intl.message(
      '$size天后过期',
      name: 'allPageExpiresAfterAFewDays',
      desc: '',
      args: [size],
    );
  }

  /// `筛选`
  String get allPageFilterTitle {
    return Intl.message('筛选', name: 'allPageFilterTitle', desc: '', args: []);
  }

  /// `清空`
  String get allPageFilterClear {
    return Intl.message('清空', name: 'allPageFilterClear', desc: '', args: []);
  }

  /// `只看临期`
  String get allPageFilterOnlyExpiry {
    return Intl.message(
      '只看临期',
      name: 'allPageFilterOnlyExpiry',
      desc: '',
      args: [],
    );
  }

  /// `名称`
  String get allPageFilterItemName {
    return Intl.message(
      '名称',
      name: 'allPageFilterItemName',
      desc: '',
      args: [],
    );
  }

  /// `生产日期-开始`
  String get allPageFilterCreateDateStart {
    return Intl.message(
      '生产日期-开始',
      name: 'allPageFilterCreateDateStart',
      desc: '',
      args: [],
    );
  }

  /// `生产日期-结束`
  String get allPageFilterCreateDateEnd {
    return Intl.message(
      '生产日期-结束',
      name: 'allPageFilterCreateDateEnd',
      desc: '',
      args: [],
    );
  }

  /// `保质期-开始`
  String get allPageFilterOverDateStart {
    return Intl.message(
      '保质期-开始',
      name: 'allPageFilterOverDateStart',
      desc: '',
      args: [],
    );
  }

  /// `保质期-结束`
  String get allPageFilterOverDateEnd {
    return Intl.message(
      '保质期-结束',
      name: 'allPageFilterOverDateEnd',
      desc: '',
      args: [],
    );
  }

  /// `剩余天数`
  String get allPageFilterLastDays {
    return Intl.message(
      '剩余天数',
      name: 'allPageFilterLastDays',
      desc: '',
      args: [],
    );
  }

  /// `未选择`
  String get allPageFilterTypeUnknown {
    return Intl.message(
      '未选择',
      name: 'allPageFilterTypeUnknown',
      desc: '',
      args: [],
    );
  }

  /// `删除`
  String get allPageItemDelete {
    return Intl.message('删除', name: 'allPageItemDelete', desc: '', args: []);
  }

  /// `修改`
  String get allPageItemModify {
    return Intl.message('修改', name: 'allPageItemModify', desc: '', args: []);
  }

  /// `请输入正确日期格式`
  String get allPageFilterDateError {
    return Intl.message(
      '请输入正确日期格式',
      name: 'allPageFilterDateError',
      desc: '',
      args: [],
    );
  }

  /// `天`
  String get unitDays {
    return Intl.message('天', name: 'unitDays', desc: '', args: []);
  }

  /// `确认要删除?`
  String get confirmTheDeletion {
    return Intl.message(
      '确认要删除?',
      name: 'confirmTheDeletion',
      desc: '',
      args: [],
    );
  }

  /// `取消`
  String get cancel {
    return Intl.message('取消', name: 'cancel', desc: '', args: []);
  }

  /// `确认`
  String get confirm {
    return Intl.message('确认', name: 'confirm', desc: '', args: []);
  }

  /// `临期详情`
  String get detailsPageTitle {
    return Intl.message('临期详情', name: 'detailsPageTitle', desc: '', args: []);
  }

  /// `名称：`
  String get detailsPageItemName {
    return Intl.message('名称：', name: 'detailsPageItemName', desc: '', args: []);
  }

  /// `生产日期：`
  String get detailsPageItemCreateDate {
    return Intl.message(
      '生产日期：',
      name: 'detailsPageItemCreateDate',
      desc: '',
      args: [],
    );
  }

  /// `保质期：`
  String get detailsPageItemOverDate {
    return Intl.message(
      '保质期：',
      name: 'detailsPageItemOverDate',
      desc: '',
      args: [],
    );
  }

  /// `已经过期：`
  String get detailsPageItemTipsExpiry {
    return Intl.message(
      '已经过期：',
      name: 'detailsPageItemTipsExpiry',
      desc: '',
      args: [],
    );
  }

  /// `有效时长：`
  String get detailsPageItemTipsDays {
    return Intl.message(
      '有效时长：',
      name: 'detailsPageItemTipsDays',
      desc: '',
      args: [],
    );
  }

  /// `临期提醒：`
  String get detailsPageItemReminder {
    return Intl.message(
      '临期提醒：',
      name: 'detailsPageItemReminder',
      desc: '',
      args: [],
    );
  }

  /// `分类：`
  String get detailsPageItemType {
    return Intl.message('分类：', name: 'detailsPageItemType', desc: '', args: []);
  }

  /// `添加`
  String get addPageTitle {
    return Intl.message('添加', name: 'addPageTitle', desc: '', args: []);
  }

  /// `名称`
  String get addPageItemName {
    return Intl.message('名称', name: 'addPageItemName', desc: '', args: []);
  }

  /// `日期`
  String get date {
    return Intl.message('日期', name: 'date', desc: '', args: []);
  }

  /// `日期 or 天数`
  String get dateOrDays {
    return Intl.message('日期 or 天数', name: 'dateOrDays', desc: '', args: []);
  }

  /// `临期提醒`
  String get addPageItemReinder {
    return Intl.message('临期提醒', name: 'addPageItemReinder', desc: '', args: []);
  }

  /// `例如：临期前6天提醒你处理`
  String get addPageRemindHelper {
    return Intl.message(
      '例如：临期前6天提醒你处理',
      name: 'addPageRemindHelper',
      desc: '',
      args: [],
    );
  }

  /// `有效期必须大于0天`
  String get addPageErrorDateZero {
    return Intl.message(
      '有效期必须大于0天',
      name: 'addPageErrorDateZero',
      desc: '',
      args: [],
    );
  }

  /// `你看看这保质期太久了吧`
  String get addPageErrorDateBig {
    return Intl.message(
      '你看看这保质期太久了吧',
      name: 'addPageErrorDateBig',
      desc: '',
      args: [],
    );
  }

  /// `咱自己都活不了那么久`
  String get addPageErrorTimeTooLong {
    return Intl.message(
      '咱自己都活不了那么久',
      name: 'addPageErrorTimeTooLong',
      desc: '',
      args: [],
    );
  }

  /// `保质期必须大于生产日期`
  String get addPageErrorShelfLifeTooSmall {
    return Intl.message(
      '保质期必须大于生产日期',
      name: 'addPageErrorShelfLifeTooSmall',
      desc: '',
      args: [],
    );
  }

  /// `天数不能超过有效期范围`
  String get addPageErrorRDaysOverflow {
    return Intl.message(
      '天数不能超过有效期范围',
      name: 'addPageErrorRDaysOverflow',
      desc: '',
      args: [],
    );
  }

  /// `名称不能为空`
  String get addPageErrorNameEmpty {
    return Intl.message(
      '名称不能为空',
      name: 'addPageErrorNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `生产日期不能为空`
  String get addPageErrorCreateDateEmpty {
    return Intl.message(
      '生产日期不能为空',
      name: 'addPageErrorCreateDateEmpty',
      desc: '',
      args: [],
    );
  }

  /// `保质期不能为空`
  String get addPageErrorOverDateEmpty {
    return Intl.message(
      '保质期不能为空',
      name: 'addPageErrorOverDateEmpty',
      desc: '',
      args: [],
    );
  }

  /// `空空如也`
  String get statePageEmpty {
    return Intl.message('空空如也', name: 'statePageEmpty', desc: '', args: []);
  }

  /// `出错了,点击重试`
  String get statePageRetry {
    return Intl.message('出错了,点击重试', name: 'statePageRetry', desc: '', args: []);
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
