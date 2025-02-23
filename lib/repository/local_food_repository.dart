import 'package:foods_assistant/bean/food.dart';
import 'package:foods_assistant/bean/result.dart';
import 'package:foods_assistant/db/data/food_collection.dart';
import 'package:foods_assistant/objectbox.g.dart';
import 'package:foods_assistant/repository/foods_repository.dart';

class LocalFoodRepository extends FoodsRepository {
  final Store _store;

  LocalFoodRepository(this._store);

  @override
  Future<FoodResult<Food>> addFood(Food food) {
    var box = Box<FoodCollection>(_store);
    var foodCollection = FoodCollection(
        name: food.name,
        productionDate: food.productionDate,
        category: food.category.index,
        safeguardDay: food.safeguardDay!,
        expiredDate: food.expiredTime!);
    box.put(foodCollection);
    food.id = foodCollection.id!;
    return Future.value(FoodResult.success(food));
  }

  @override
  Future<FoodResult<bool>> deleteFood(int foodId) {
    var box = Box<FoodCollection>(_store);
    if (box.remove(foodId)) {
      return Future.value(FoodResult.success(true));
    } else {
      return Future.value(FoodResult.error());
    }
  }

  @override
  Future<FoodResult<List<Food>>> getAllFoods() {
    var box = Box<FoodCollection>(_store);
    var foods = box
        .getAll()
        .map((e) => Food(
              id: e.id!,
              name: e.name,
              productionDate: e.productionDate,
              category: FoodCategory.values[e.category],
              safeguardDay: e.safeguardDay,
              expiredTime: e.expiredDate,
            ))
        .toList();
    return Future.value(FoodResult.success(foods));
  }

  @override
  Future<FoodResult<List<Food>>> getExpirationFoods(
      {FoodCategory? category, int? lastDays}) async {
    var box = Box<FoodCollection>(_store);
    QueryBuilder<FoodCollection> query;
    Condition<FoodCollection>? condition;
    if (category != null) {
      condition = FoodCollection_.category.equals(category.index);
    }
    DateTime now = DateTime.now();
    if (lastDays != null) {
      var lastDate = now.add(Duration(days: lastDays));
      var queryRules = FoodCollection_.expiredDate
      //在临期范围内
          .betweenDate(now, lastDate)
      //或者已经过期
          .or(FoodCollection_.expiredDate.lessOrEqualDate(now));

      condition = condition == null
          ? queryRules
          : condition.and(queryRules);
    }

    if (condition == null) {
      query = box.query();
    } else {
      query = box.query(condition);
    }
    //按照时效日期从小到大排序
    var foods = query.order(FoodCollection_.expiredDate).build().find();
    if (lastDays == null) {
      foods.removeWhere(
        (element) {
          var expiredDate = element.expiredDate;
          var reminderDate =
              expiredDate.subtract(Duration(days: element.reminderDays));
          //移除不在临期范围内或者没有过期的食物
          return !_betweenDate(reminderDate, now, expiredDate) ||
              expiredDate.isAfter(now);
        },
      );
    }

    var mapList = foods.map(
      (e) {
        return Food(
          id: e.id!,
          name: e.name,
          productionDate: e.productionDate,
          category: FoodCategory.values[e.category],
          safeguardDay: e.safeguardDay,
          expiredTime: e.expiredDate,
        );
      },
    ).toList();

    return FoodResult.success(mapList);
  }

  bool _betweenDate(
      DateTime beforeDate, DateTime targetDate, DateTime afterDate) {
    if (beforeDate.isBefore(targetDate) && targetDate.isAfter(afterDate)) {
      return true;
    } else if (beforeDate.day == targetDate.day ||
        targetDate.day == afterDate.day) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<FoodResult<List<Food>>> getFoodsByCategory(
      FoodCategory category) async {
    var box = Box<FoodCollection>(_store);
    var foods = await box
        .query(FoodCollection_.category.equals(category.index))
        .build()
        .findAsync();
    return FoodResult.success(foods.map((e) {
      return Food(
        id: e.id!,
        name: e.name,
        productionDate: e.productionDate,
        category: FoodCategory.values[e.category],
        safeguardDay: e.safeguardDay,
        expiredTime: e.expiredDate,
        reminderDays: e.reminderDays,
      );
    }).toList());
  }

  @override
  Future<FoodResult<Food>> updateFood(Food food) async {
    if (food.id == null) {
      return Future.value(FoodResult.error(msg: "id不能为空"));
    }
    var box = Box<FoodCollection>(_store);
    FoodCollection? foodCollection = await box
        .query(FoodCollection_.id.equals(food.id!))
        .build()
        .findFirstAsync();
    if (foodCollection == null) {
      return FoodResult.error(msg: "id不存在");
    }
    foodCollection.name = food.name;
    foodCollection.productionDate = food.productionDate;
    foodCollection.category = food.category.index;
    foodCollection.safeguardDay = food.safeguardDay!;
    foodCollection.expiredDate = food.expiredTime!;
    foodCollection.reminderDays = food.reminderDays;
    box.put(foodCollection);
    return FoodResult.success(food);
  }

  @override
  Future<FoodResult<int>> getSizeByCategory(FoodCategory category) {
    var box = Box<FoodCollection>(_store);
    var query = box.query(FoodCollection_.category.equals(category.index)).build();
    return Future.value(FoodResult.success(query.count()));
  }
}
