import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods_assistant/db/db.dart';
import 'package:foods_assistant/repository/foods_repository.dart';
import 'package:foods_assistant/repository/local_food_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'foods_repository_provider.g.dart';

@riverpod
Future<FoodsRepository> foodRepository(Ref ref) async {
  var store = await ref.watch(dbStoreProvider.future);
  return LocalFoodRepository(store);
}
