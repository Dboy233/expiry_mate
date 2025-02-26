import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expiry_mate/db/data/food_type.dart';
import 'package:expiry_mate/db/data/food.dart';
import 'package:expiry_mate/repository/foods_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

///获取所有即将临期食品
@riverpod
Future<List<Foods>> getExpiryFood(Ref ref) async {
  var foodsRepository = await ref.watch(foodRepositoryProvider.future);
  var allFoods = await foodsRepository.getAllFoods();
  allFoods.data?.forEach((e) => debugPrint("${e.toJson()}"));

  ///获取举例过期还剩7天的食物
  var foodResult = await foodsRepository.getExpirationFoods();
  if (foodResult.data == null) {
    return [];
  }
  return foodResult.data!;
}

@riverpod
Future<List<FoodCardInfo>> getFoodsTypeInfo(Ref ref) async {
  var foodsRepository = await ref.watch(foodRepositoryProvider.future);
  var list = <FoodCardInfo>[];
  for (var fc in FoodType.values) {
    var foodResult = await foodsRepository.getSizeByType(fc);
    var i = foodResult.data ?? 0;
    list.add(FoodCardInfo(
      fc.getTypeName(),
      fc.getExample().join(','),
      fc.getIconAsset().path,
      i,
    ));
  }
  return list;
}

@riverpod
Future<int> dbAllFoodsSize(Ref ref) async {
  var foodsRepository = await ref.watch(foodRepositoryProvider.future);
  var result = await foodsRepository.getAllFoods();
  if(result.isSuccess){
    return result.data!.length;
  }
  return 0;
}

class FoodCardInfo {
  String name;
  String example;
  String iconAssets;
  int size;

  FoodCardInfo(this.name, this.example, this.iconAssets, this.size);
}
