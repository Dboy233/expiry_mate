import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods_assistant/bean/food.dart';
import 'package:foods_assistant/bean/result.dart';

abstract class FoodsRepository {
  ///获取所有食品
  Future<FoodResult<List<Food>>> getAllFoods();

  ///获取即将临期食品
  ///从数据库中查询过期的食品，
  ///如果category不为空，则只查询该分类的食品，否则查询所有食品，
  ///如果lastDays不为空，则只查询距离过期时间小于lastDays的食品(lastDays<now<保质期)，
  ///否则查询所有食品自身即将临期时间(reminderDays<now<保质期)
  ///[lastDays] 几天内过期的食品
  Future<FoodResult<List<Food>>> getExpirationFoods(
      {FoodCategory? category, int? lastDays});

  ///添加食品信息
  Future<FoodResult<Food>> addFood(Food food);

  ///删除食品信息
  Future<FoodResult<bool>> deleteFood(int foodId);

  ///修改食品信息
  Future<FoodResult<Food>> updateFood(Food food);

  ///获取某个分类的食品
  Future<FoodResult<List<Food>>> getFoodsByCategory(FoodCategory category);

  ///获取某个分类的食品数量
  Future<FoodResult<int>> getSizeByCategory(FoodCategory category);
}

