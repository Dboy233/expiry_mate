import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods_assistant/bean/food.dart';
import 'package:foods_assistant/repository/foods_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

///获取所有即将临期食品
@riverpod
Future<List<Food>> getExpiryFood(Ref ref) async {
  var foodsRepository = await ref.watch(foodRepositoryProvider.future);
  var allFoods = await foodsRepository.getAllFoods();
  allFoods.data?.forEach((e) => print(e));

  ///获取举例过期还剩7天的食物
  var foodResult = await foodsRepository.getExpirationFoods();
  if (foodResult.data == null) {
    return [];
  }
  return foodResult.data!;
}

@riverpod
Future<List<FoodCardInfo>> getFoodsCategoryInfo(Ref ref) async {
  var foodsRepository = await ref.watch(foodRepositoryProvider.future);
  var list = <FoodCardInfo>[];
  for (var fc in FoodCategory.values) {
    var foodResult = await foodsRepository.getSizeByCategory(fc);
    var i = foodResult.data ?? 0;
    list.add(FoodCardInfo(
      FoodCategoryHelper.getName(fc),
      FoodCategoryHelper.getExample(fc).join(','),
      FoodCategoryHelper.getCategoryImage(fc).path,
      i,
    ));
  }
  return list;
}

class FoodCardInfo {
  String name;
  String example;
  String iconAssets;
  int size;

  FoodCardInfo(this.name, this.example, this.iconAssets, this.size);
}
