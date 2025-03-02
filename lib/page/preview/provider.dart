import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/repository/expiry_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class ItemDetails extends _$ItemDetails {
  @override
  Future<ExpiryItem> build(int id) async {
    final repository = await ref.read(appRepositoryProvider.future);
    final result = await repository.getItem(id);
    if (result.isSuccess) {
      return result.requiredData;
    } else {
      return Future.error("没有查询到id:$id 的数据");
    }
  }

  Future<bool> delete(int id) async {
    final repository = await ref.read(appRepositoryProvider.future);
    var dataResult = await repository.deleteExpiryItem(id);
    if (dataResult.isSuccess) {
      ref.invalidate(appRepositoryProvider);
      return true;
    } else {
      return false;
    }
  }
}
