// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createNewItemHash() => r'895d773e322c86311ca746178a039999008f0a72';

///fixme: 有一个更好的更新优化逻辑：
///       更新时间，只修改时间，然后再去将自己更新后的时间交给附属有关联的
///       更新函数去处理，不负责其他参数的主动修改。
///
/// Copied from [CreateNewItem].
@ProviderFor(CreateNewItem)
final createNewItemProvider =
    AutoDisposeNotifierProvider<CreateNewItem, DataResult<ExpiryItem>>.internal(
  CreateNewItem.new,
  name: r'createNewItemProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createNewItemHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateNewItem = AutoDisposeNotifier<DataResult<ExpiryItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
