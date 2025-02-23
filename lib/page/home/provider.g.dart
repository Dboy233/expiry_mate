// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getExpiryFoodHash() => r'5c486467f5aab03df4c723f45ea79f3c5e95e98f';

///获取所有即将临期食品
///
/// Copied from [getExpiryFood].
@ProviderFor(getExpiryFood)
final getExpiryFoodProvider = AutoDisposeFutureProvider<List<Food>>.internal(
  getExpiryFood,
  name: r'getExpiryFoodProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getExpiryFoodHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetExpiryFoodRef = AutoDisposeFutureProviderRef<List<Food>>;
String _$getFoodsCategoryInfoHash() =>
    r'7e5fa53a625d9a34fdca4165658a8cef5dc06aee';

/// See also [getFoodsCategoryInfo].
@ProviderFor(getFoodsCategoryInfo)
final getFoodsCategoryInfoProvider =
    AutoDisposeFutureProvider<List<FoodCardInfo>>.internal(
  getFoodsCategoryInfo,
  name: r'getFoodsCategoryInfoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFoodsCategoryInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetFoodsCategoryInfoRef
    = AutoDisposeFutureProviderRef<List<FoodCardInfo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
