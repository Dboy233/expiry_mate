import 'package:expiry_mate/bean/expiry_filter_data.dart';
import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/repository/app_repository_provider.dart';
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
    //这里使用read，而不是watch，因为UI层面需要等待动画的执行才进行同步更新
    //如果使用read，当动画未执行的时候，进行了delete并更新了数据库，此时便会导致动画异常。
    var repository = await ref.read(appExpiryItemRepositoryProvider.future);
    var result = await repository.queryExpiryItem(filter);
    return result.data ?? [];
  }

  Future<bool> deleteFromDB(int id) async {
    var repository = await ref.read(appExpiryItemRepositoryProvider.future);
    final result = await repository.deleteExpiryItem(id);
    if (result.isSuccess) {
      ref.invalidate(appExpiryItemRepositoryProvider);
      return true;
    } else {
      return false;
    }
  }

  ///这里为什么要主动更新呢，因为update不会让state进行loading操作，页面不会重新进入loading。
  ///当列表为空的时候，再更新state为[],显示empty页面。
  updateList() async {
    var filter = ref.read(expiryFilterProvider(lockType));
    var repository = await ref.read(appExpiryItemRepositoryProvider.future);
    var result = await repository.queryExpiryItem(filter);
    if(result.data?.isNotEmpty ==true){
      update(
            (p0) {
          return result.data!;
        },
      );
    }else{
      state = AsyncData([]);
    }
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
}
