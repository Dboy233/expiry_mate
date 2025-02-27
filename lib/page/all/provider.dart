import 'package:expiry_mate/bean/expiry_filter_data.dart';
import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/repository/expiry_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class ExpiryItemList extends _$ExpiryItemList {
  @override
  FutureOr<List<ExpiryItem>> build(
    ///类型锁定，如果为null则使用[ExpiryFilterData]的类型值
    ExpiryType? lockType,
  ) async {
    var filter = ref.watch(expiryFilterProvider(lockType));
    var repository = await ref.read(appRepositoryProvider.future);
    var result = await repository.queryExpiryItem(filter);
    return result.data ?? [];
  }

  ///删除临期条目
  void deleteExpiryItem(int id) async {
    var repository = await ref.read(appRepositoryProvider.future);
    await repository.deleteExpiryItem(id);
  }
}

@riverpod
class ExpiryFilter extends _$ExpiryFilter {
  @override
  ExpiryFilterData build(
    ///类型锁定，如果类型为null，则ExpiryFilterData的type可以修改.
    ExpiryType? lockType,
  ) {
    return ExpiryFilterData(type: lockType?.index);
  }

  void setCreateTimeFilter(DateTime createTimeEarly, DateTime createTimeLater) {
    state = state.copyWith(
      createTimeFirst: createTimeEarly,
      createTimeLast: createTimeLater,
    );
  }
}
