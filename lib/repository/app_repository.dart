//对特定数据操作方法抽象

import 'package:expiry_mate/bean/expiry_filter_data.dart';
import 'package:expiry_mate/bean/result.dart';
import 'package:expiry_mate/db/data/config.dart';
import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';

///针对数据库表：[ExpiryItem]的操作抽象
abstract class ExpiryItemRepository {
  Future<DataResult<ExpiryItem>> getItem(int id);

  ///获取所有临期项目
  Future<DataResult<List<ExpiryItem>>> getAllExpiryItems();

  ///获取即将临期项目
  ///从数据库中查询过期的项目，
  ///如果type不为空，则只查询该分类，否则查询所有，
  ///如果lastDays不为空，则只查询距离过期时间小于lastDays的(lastDays<now<保质期)，
  ///否则查询所有自身即将临期时间(reminderDays<now<保质期)
  ///[lastDays] 几天内过期
  Future<DataResult<List<ExpiryItem>>> getExpirationItem(
      {ExpiryType? type, int? lastDays});

  ///添加息
  Future<DataResult<ExpiryItem>> addExpiryItem(ExpiryItem item);

  ///删除
  Future<DataResult<bool>> deleteExpiryItem(int id);

  ///修改
  Future<DataResult<ExpiryItem>> updateExpiryItem(ExpiryItem newItem);

  ///获取某个分类的
  Future<DataResult<List<ExpiryItem>>> getExpiryByType(ExpiryType type);

  ///获取某个分类的数量
  Future<DataResult<int>> getSizeByType(ExpiryType type);

  ///查询
  Future<DataResult<List<ExpiryItem>>> queryExpiryItem(ExpiryFilterData filter);
}

///针对数据库表[Config]的操作抽象
abstract class ConfigRepository {
  Config getCurrentConfig();

  ///获取应用主题模式
  int getAppThemeMode();

  ///改变应用主题模式
  void changeMode();

  ///获取app地区码
  String getAppLocalCode();

  ///改变app地区码
  void changeLocal(String localCode);
}
