import 'package:expiry_mate/bean/expiry_filter_data.dart';
import 'package:expiry_mate/bean/result.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/objectbox.g.dart';
import 'package:expiry_mate/repository/expiry_repository.dart';
import 'package:flutter/cupertino.dart';

import '../db/data/expiry_item.dart';

class LocalRepository extends ExpiryRepository {
  final Store _store;

  LocalRepository(this._store);

  @override
  Future<DataResult<ExpiryItem>> getItem(int id) {
    var box = Box<ExpiryItem>(_store);
    var expiryItem = box.get(id);
    if (expiryItem == null) {
      return Future.error('没有id:$id的数据');
    }
    return Future.value(DataResult.success(expiryItem));
  }

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
      ExpiryFilterData filter) async {
    var box = Box<ExpiryItem>(_store);
    debugPrint(filter.toString());
    if (filter.isExpiry == true) {
      return getExpirationItem();
    }

    //用类型进行初始查询条件，设置类型了就查询某个类型，没设置就反向查
    //todo 查询有问题
    Condition<ExpiryItem> condition = filter.type == null
        ? ExpiryItem_.type.notNull() //不为null就是全部类型
        : ExpiryItem_.type.equals(filter.type!);
    //名字
    if (filter.name != null && filter.name!.isNotEmpty) {
      condition = condition.and(ExpiryItem_.name.equals(filter.name!));
    }

    //生产日期的筛选
    if (filter.createDateStart != null && filter.createDateEnd == null) {
      condition = condition.and(
          ExpiryItem_.createDate.greaterOrEqualDate(filter.createDateStart!));
    } else if (filter.createDateStart == null && filter.createDateEnd != null) {
      condition = condition
          .and(ExpiryItem_.createDate.lessOrEqualDate(filter.createDateEnd!));
    } else if (filter.createDateStart != null && filter.createDateEnd != null) {
      condition = condition.and(ExpiryItem_.createDate
          .betweenDate(filter.createDateStart!, filter.createDateEnd!));
    }

    //保质期时间查询
    if (filter.overDateStart != null && filter.overDateEnd == null) {
      condition = condition
          .and(ExpiryItem_.overDate.greaterOrEqualDate(filter.overDateStart!));
    } else if (filter.overDateStart == null && filter.overDateEnd != null) {
      condition = condition
          .and(ExpiryItem_.overDate.lessOrEqualDate(filter.overDateEnd!));
    } else if (filter.overDateStart != null && filter.overDateEnd != null) {
      debugPrint('保质期筛选');
      condition = condition.and(ExpiryItem_.overDate
          .betweenDate(filter.overDateStart!, filter.overDateEnd!));
    }

    //剩余天数查询
    if (filter.lastDays != null) {
      final now = DateTime.now();
      final lastDate = now.add(Duration(days: filter.lastDays!+1));
      condition =
          condition.and(ExpiryItem_.overDate.betweenDate(now, lastDate));
    }

    var list = box.query(condition).order(ExpiryItem_.overDate).build().find();

    return DataResult.success(list);
  }
}
