import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expiry_mate/db/db.dart';
import 'package:expiry_mate/repository/foods_repository.dart';
import 'package:expiry_mate/repository/local_food_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'foods_repository_provider.g.dart';

@riverpod
Future<FoodsRepository> foodRepository(Ref ref) async {
  var store = await ref.watch(dbStoreProvider.future);
  return LocalFoodRepository(store);
}

