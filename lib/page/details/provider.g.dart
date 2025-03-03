// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemDetailsHash() => r'5d4466671b7ab5d9b6fc3f4fce67ef3fbcf29294';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ItemDetails
    extends BuildlessAutoDisposeAsyncNotifier<ExpiryItem> {
  late final int id;

  FutureOr<ExpiryItem> build(
    int id,
  );
}

/// See also [ItemDetails].
@ProviderFor(ItemDetails)
const itemDetailsProvider = ItemDetailsFamily();

/// See also [ItemDetails].
class ItemDetailsFamily extends Family<AsyncValue<ExpiryItem>> {
  /// See also [ItemDetails].
  const ItemDetailsFamily();

  /// See also [ItemDetails].
  ItemDetailsProvider call(
    int id,
  ) {
    return ItemDetailsProvider(
      id,
    );
  }

  @override
  ItemDetailsProvider getProviderOverride(
    covariant ItemDetailsProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'itemDetailsProvider';
}

/// See also [ItemDetails].
class ItemDetailsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ItemDetails, ExpiryItem> {
  /// See also [ItemDetails].
  ItemDetailsProvider(
    int id,
  ) : this._internal(
          () => ItemDetails()..id = id,
          from: itemDetailsProvider,
          name: r'itemDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$itemDetailsHash,
          dependencies: ItemDetailsFamily._dependencies,
          allTransitiveDependencies:
              ItemDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  ItemDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<ExpiryItem> runNotifierBuild(
    covariant ItemDetails notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ItemDetails Function() create) {
    return ProviderOverride(
      origin: this,
      override: ItemDetailsProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ItemDetails, ExpiryItem>
      createElement() {
    return _ItemDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ItemDetailsRef on AutoDisposeAsyncNotifierProviderRef<ExpiryItem> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ItemDetailsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ItemDetails, ExpiryItem>
    with ItemDetailsRef {
  _ItemDetailsProviderElement(super.provider);

  @override
  int get id => (origin as ItemDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
