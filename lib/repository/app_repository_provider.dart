import 'package:expiry_mate/db/db.dart';
import 'package:expiry_mate/repository/app_repository.dart';
import 'package:expiry_mate/repository/local_config_repository.dart';
import 'package:expiry_mate/repository/local_expiry_item_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_repository_provider.g.dart';

@riverpod
Future<ExpiryItemRepository> appExpiryItemRepository(Ref ref) async {
  var box = await ref.watch(expiryItemStoreProvider.future);
  return LocalExpiryItemRepository(box);
}

@riverpod
Future<ConfigRepository> appConfigRepository(Ref ref) async {
  var box = await ref.watch(configStoreProvider.future);
  return LocalConfigRepository(box);
}
