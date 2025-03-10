import 'package:expiry_mate/db/data/expiry_item.dart';
import 'package:expiry_mate/db/data/expiry_type.dart';
import 'package:expiry_mate/repository/app_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

///获取所有即将临期食品
@riverpod
Future<List<ExpiryItem>> getSoonExpiryItem(Ref ref) async {
  var appRepository = await ref.watch(appExpiryItemRepositoryProvider.future);

  ///获取快要过期的
  var result = await appRepository.getExpirationItem();
  if (result.data == null) {
    return [];
  }
  return result.data!;
}

@riverpod
Future<List<ExpiryCardInfo>> getExpiryItemTypeInfo(Ref ref) async {
  var appRepository = await ref.watch(appExpiryItemRepositoryProvider.future);
  var list = <ExpiryCardInfo>[];
  for (var fc in ExpiryType.values) {
    var result = await appRepository.getSizeByType(fc);
    var i = result.data ?? 0;
    list.add(ExpiryCardInfo(
      fc.getExample().join(','),
      fc.getIconAsset().path,
      i,
      fc,
    ));
  }
  return list;
}

@riverpod
Future<int> dbAllExpirySize(Ref ref) async {
  var appRepository = await ref.watch(appExpiryItemRepositoryProvider.future);
  var result = await appRepository.getAllExpiryItems();
  if (result.isSuccess) {
    return result.data!.length;
  }
  return 0;
}

class ExpiryCardInfo {
  String example;
  String iconAssets;
  int size;
  ExpiryType type;
  ExpiryCardInfo(this.example, this.iconAssets, this.size,this.type);
}
