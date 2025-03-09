// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dbStoreHash() => r'bca47c171850f6148b3e104f5d660c2da5895272';

/// See also [dbStore].
@ProviderFor(dbStore)
final dbStoreProvider = AutoDisposeFutureProvider<Store>.internal(
  dbStore,
  name: r'dbStoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dbStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DbStoreRef = AutoDisposeFutureProviderRef<Store>;
String _$expiryItemStoreHash() => r'674c7254f835a53767144333fa36087b22ea6f7b';

///向外部提供可操作的[ExpiryItem]Box对象
///
/// Copied from [expiryItemStore].
@ProviderFor(expiryItemStore)
final expiryItemStoreProvider =
    AutoDisposeFutureProvider<Box<ExpiryItem>>.internal(
  expiryItemStore,
  name: r'expiryItemStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expiryItemStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExpiryItemStoreRef = AutoDisposeFutureProviderRef<Box<ExpiryItem>>;
String _$configStoreHash() => r'f3ec66624a5f2df4d3e012edf09afa1316d9121a';

///向外部提供可操作的[Config]Box对象
///
/// Copied from [configStore].
@ProviderFor(configStore)
final configStoreProvider = AutoDisposeFutureProvider<Box<Config>>.internal(
  configStore,
  name: r'configStoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$configStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConfigStoreRef = AutoDisposeFutureProviderRef<Box<Config>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
