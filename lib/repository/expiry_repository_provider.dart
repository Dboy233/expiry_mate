import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expiry_mate/db/db.dart';
import 'package:expiry_mate/repository/expiry_repository.dart';
import 'package:expiry_mate/repository/local_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expiry_repository_provider.g.dart';

@riverpod
Future<ExpiryRepository> appRepository(Ref ref) async {
  var store = await ref.watch(dbStoreProvider.future);
  return LocalRepository(store);
}

