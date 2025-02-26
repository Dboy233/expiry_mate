import 'package:expiry_mate/bean/result.dart';
import 'package:expiry_mate/db/data/food_type.dart';
import 'package:expiry_mate/objectbox.g.dart';
import 'package:expiry_mate/repository/foods_repository.dart';

import '../db/data/food.dart';

class LocalFoodRepository extends FoodsRepository {
  final Store _store;

  LocalFoodRepository(this._store);

  @override
  Future<DataResult<Foods>> addFood(Foods food) {
    var box = Box<Foods>(_store);
    box.put(food);
    return Future.value(DataResult.success(food));
  }

  @override
  Future<DataResult<bool>> deleteFood(int foodId) {
    var box = Box<Foods>(_store);
    if (box.remove(foodId)) {
      return Future.value(DataResult.success(true));
    } else {
      return Future.value(DataResult.error());
    }
  }

  @override
  Future<DataResult<List<Foods>>> getAllFoods() async {
    var box = Box<Foods>(_store);
    var foods = await box.getAllAsync();
    return Future.value(DataResult.success(foods));
  }

  @override
  Future<DataResult<List<Foods>>> getExpirationFoods(
      {FoodType? type, int? lastDays}) async {
    var box = Box<Foods>(_store);
    QueryBuilder<Foods> query;
    Condition<Foods>? condition;
    if (type != null) {
      condition = Foods_.type.equals(type.index);
    }
    DateTime now = DateTime.now();
    if (lastDays != null) {
      var lastDate = now.add(Duration(days: lastDays+1));
      var queryRules = Foods_.overDate
          //在临期范围内
          .betweenDate(now, lastDate)
          //或者已经过期
          .or(Foods_.overDate.lessOrEqualDate(now));

      condition = condition == null ? queryRules : condition.and(queryRules);
    }

    if (condition == null) {
      query = box.query();
    } else {
      query = box.query(condition);
    }
    //按照时效日期从小到大排序
    var foods = query.order(Foods_.overDate).build().find();
    if (lastDays == null) {
      foods.removeWhere(
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
    return DataResult.success(foods);
  }

  @override
  Future<DataResult<List<Foods>>> getFoodsByType(FoodType type) async {
    var box = Box<Foods>(_store);
    var foods =
        await box.query(Foods_.type.equals(type.index)).build().findAsync();
    return DataResult.success(foods);
  }

  @override
  Future<DataResult<Foods>> updateFood(Foods newFood) async {
    if (newFood.id == null) {
      return Future.value(DataResult.error(msg: "id不能为空"));
    }
    var box = Box<Foods>(_store);
    Foods? food =
        await box.query(Foods_.id.equals(newFood.id!)).build().findFirstAsync();
    if (food == null) {
      return DataResult.error(msg: "id不存在");
    }
    var call = food.copyWith.call(
      name: newFood.name,
      createDate: newFood.createDate,
      safeDays: newFood.safeDays,
      overDate: newFood.overDate,
      reminderDays: newFood.reminderDays,
      type: newFood.type,
      tag: newFood.tag,
    );
    //更新
    await box.putAsync(call);
    return DataResult.success(call);
  }

  @override
  Future<DataResult<int>> getSizeByType(FoodType type) {
    var box = Box<Foods>(_store);
    var query = box.query(Foods_.type.equals(type.index)).build();
    return Future.value(DataResult.success(query.count()));
  }
}
