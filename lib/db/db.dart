import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods_assistant/bean/food.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../objectbox.g.dart';
import 'data/food_collection.dart';

part 'db.g.dart';

@riverpod
Future<Store> dbStore(Ref ref) async {
  final docsDir = await getApplicationDocumentsDirectory();
  final store = await openStore(directory: p.join(docsDir.path, "foods_db"));
  var foods = Box<FoodCollection>(store);
  ///添加假数据
  if (foods.isEmpty()) {
    var list = generateFakeFoods(10);
    for (var element in list) {
      foods.put(FoodCollection(
        name: element.name,
        productionDate: element.productionDate,
        category: element.category.index,
        safeguardDay: element.safeguardDay!,
        expiredDate: element.expiredTime!,
      ));
    }
  }
  return store;
}
