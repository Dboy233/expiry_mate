import 'package:expiry_mate/bean/expiry_filter_data.dart';
import 'package:expiry_mate/bean/result.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/objectbox.g.dart';
import 'package:expiry_mate/repository/expiry_repository.dart';

import '../db/data/expiry_item.dart';

class LocalRepository extends ExpiryRepository {
  final Store _store;

  LocalRepository(this._store);

  @override
  Future<DataResult<ExpiryItem>> addExpiryItem(ExpiryItem item) {
    var box = Box<ExpiryItem>(_store);
    box.put(item);
    return Future.value(DataResult.success(item));
  }

  @override
  Future<DataResult<bool>> deleteExpiryItem(int id) {
    var box = Box<ExpiryItem>(_store);
    if (box.remove(id)) {
      return Future.value(DataResult.success(true));
    } else {
      return Future.value(DataResult.error());
    }
  }

  @override
  Future<DataResult<List<ExpiryItem>>> getAllExpiryItems() async {
    var box = Box<ExpiryItem>(_store);
    var items = await box.getAllAsync();
    return Future.value(DataResult.success(items));
  }

  @override
  Future<DataResult<List<ExpiryItem>>> getExpirationItem(
      {ExpiryType? type, int? lastDays}) async {
    var box = Box<ExpiryItem>(_store);
    QueryBuilder<ExpiryItem> query;
    Condition<ExpiryItem>? condition;
    if (type != null) {
      condition = ExpiryItem_.type.equals(type.index);
    }
    DateTime now = DateTime.now();
    if (lastDays != null) {
      var lastDate = now.add(Duration(days: lastDays + 1));
      var queryRules = ExpiryItem_.overDate
          //在临期范围内
          .betweenDate(now, lastDate)
          //或者已经过期
          .or(ExpiryItem_.overDate.lessOrEqualDate(now));

      condition = condition == null ? queryRules : condition.and(queryRules);
    }

    if (condition == null) {
      query = box.query();
    } else {
      query = box.query(condition);
    }
    //按照时效日期从小到大排序
    var item = query.order(ExpiryItem_.overDate).build().find();
    if (lastDays == null) {
      item.removeWhere(
        (element) {
          var overDate = element.overDate;
          var reminderDate = element.getReminderDate();
          if (overDate == null || reminderDate == null) {
            //移除无法判断的数据
            return true;
          }
          //移除不在临期范围内或者没有过期的食物
          return now.isBefore(reminderDate);
        },
      );
    }
    return DataResult.success(item);
  }

  @override
  Future<DataResult<List<ExpiryItem>>> getExpiryByType(ExpiryType type) async {
    var box = Box<ExpiryItem>(_store);
    var item = await box
        .query(ExpiryItem_.type.equals(type.index))
        .build()
        .findAsync();
    return DataResult.success(item);
  }

  @override
  Future<DataResult<ExpiryItem>> updateExpiryItem(ExpiryItem newItem) async {
    if (newItem.id == null) {
      return Future.value(DataResult.error(msg: "id不能为空"));
    }
    var box = Box<ExpiryItem>(_store);
    ExpiryItem? item = await box
        .query(ExpiryItem_.id.equals(newItem.id!))
        .build()
        .findFirstAsync();
    if (item == null) {
      return DataResult.error(msg: "id不存在");
    }
    var call = item.copyWith.call(
      name: newItem.name,
      createDate: newItem.createDate,
      safeDays: newItem.safeDays,
      overDate: newItem.overDate,
      reminderDays: newItem.reminderDays,
      type: newItem.type,
      tag: newItem.tag,
    );
    //更新
    await box.putAsync(call);
    return DataResult.success(call);
  }

  @override
  Future<DataResult<int>> getSizeByType(ExpiryType type) {
    var box = Box<ExpiryItem>(_store);
    var query = box.query(ExpiryItem_.type.equals(type.index)).build();
    return Future.value(DataResult.success(query.count()));
  }

  @override
  Future<DataResult<List<ExpiryItem>>> queryExpiryItem(
      ExpiryFilterData filter) {
    // TODO: implement queryExpiryItem
    throw UnimplementedError();
  }
}
