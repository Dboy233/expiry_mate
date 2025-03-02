// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expiryItemListHash() => r'fe632b7be897223ce91fbb2c0dc93ffdf254726e';

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

abstract class _$ExpiryItemList
    extends BuildlessAutoDisposeAsyncNotifier<List<ExpiryItem>> {
  late final ExpiryType? lockType;

  FutureOr<List<ExpiryItem>> build(
    ExpiryType? lockType,
  );
}

/// See also [ExpiryItemList].
@ProviderFor(ExpiryItemList)
const expiryItemListProvider = ExpiryItemListFamily();

/// See also [ExpiryItemList].
class ExpiryItemListFamily extends Family<AsyncValue<List<ExpiryItem>>> {
  /// See also [ExpiryItemList].
  const ExpiryItemListFamily();

  /// See also [ExpiryItemList].
  ExpiryItemListProvider call(
    ExpiryType? lockType,
  ) {
    return ExpiryItemListProvider(
      lockType,
    );
  }

  @override
  ExpiryItemListProvider getProviderOverride(
    covariant ExpiryItemListProvider provider,
  ) {
    return call(
      provider.lockType,
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
  String? get name => r'expiryItemListProvider';
}

/// See also [ExpiryItemList].
class ExpiryItemListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ExpiryItemList, List<ExpiryItem>> {
  /// See also [ExpiryItemList].
  ExpiryItemListProvider(
    ExpiryType? lockType,
  ) : this._internal(
          () => ExpiryItemList()..lockType = lockType,
          from: expiryItemListProvider,
          name: r'expiryItemListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expiryItemListHash,
          dependencies: ExpiryItemListFamily._dependencies,
          allTransitiveDependencies:
              ExpiryItemListFamily._allTransitiveDependencies,
          lockType: lockType,
        );

  ExpiryItemListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lockType,
  }) : super.internal();

  final ExpiryType? lockType;

  @override
  FutureOr<List<ExpiryItem>> runNotifierBuild(
    covariant ExpiryItemList notifier,
  ) {
    return notifier.build(
      lockType,
    );
  }

  @override
  Override overrideWith(ExpiryItemList Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExpiryItemListProvider._internal(
        () => create()..lockType = lockType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lockType: lockType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ExpiryItemList, List<ExpiryItem>>
      createElement() {
    return _ExpiryItemListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpiryItemListProvider && other.lockType == lockType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lockType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExpiryItemListRef
    on AutoDisposeAsyncNotifierProviderRef<List<ExpiryItem>> {
  /// The parameter `lockType` of this provider.
  ExpiryType? get lockType;
}

class _ExpiryItemListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ExpiryItemList,
        List<ExpiryItem>> with ExpiryItemListRef {
  _ExpiryItemListProviderElement(super.provider);

  @override
  ExpiryType? get lockType => (origin as ExpiryItemListProvider).lockType;
}

String _$expiryFilterHash() => r'1c29f64bb39b1ae429eff3b2a454f91866416137';

abstract class _$ExpiryFilter
    extends BuildlessAutoDisposeNotifier<ExpiryFilterData> {
  late final ExpiryType? lockType;

  ExpiryFilterData build(
    ExpiryType? lockType,
  );
}

/// See also [ExpiryFilter].
@ProviderFor(ExpiryFilter)
const expiryFilterProvider = ExpiryFilterFamily();

/// See also [ExpiryFilter].
class ExpiryFilterFamily extends Family<ExpiryFilterData> {
  /// See also [ExpiryFilter].
  const ExpiryFilterFamily();

  /// See also [ExpiryFilter].
  ExpiryFilterProvider call(
    ExpiryType? lockType,
  ) {
    return ExpiryFilterProvider(
      lockType,
    );
  }

  @override
  ExpiryFilterProvider getProviderOverride(
    covariant ExpiryFilterProvider provider,
  ) {
    return call(
      provider.lockType,
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
  String? get name => r'expiryFilterProvider';
}

/// See also [ExpiryFilter].
class ExpiryFilterProvider
    extends AutoDisposeNotifierProviderImpl<ExpiryFilter, ExpiryFilterData> {
  /// See also [ExpiryFilter].
  ExpiryFilterProvider(
    ExpiryType? lockType,
  ) : this._internal(
          () => ExpiryFilter()..lockType = lockType,
          from: expiryFilterProvider,
          name: r'expiryFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expiryFilterHash,
          dependencies: ExpiryFilterFamily._dependencies,
          allTransitiveDependencies:
              ExpiryFilterFamily._allTransitiveDependencies,
          lockType: lockType,
        );

  ExpiryFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lockType,
  }) : super.internal();

  final ExpiryType? lockType;

  @override
  ExpiryFilterData runNotifierBuild(
    covariant ExpiryFilter notifier,
  ) {
    return notifier.build(
      lockType,
    );
  }

  @override
  Override overrideWith(ExpiryFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExpiryFilterProvider._internal(
        () => create()..lockType = lockType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lockType: lockType,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ExpiryFilter, ExpiryFilterData>
      createElement() {
    return _ExpiryFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpiryFilterProvider && other.lockType == lockType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lockType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExpiryFilterRef on AutoDisposeNotifierProviderRef<ExpiryFilterData> {
  /// The parameter `lockType` of this provider.
  ExpiryType? get lockType;
}

class _ExpiryFilterProviderElement
    extends AutoDisposeNotifierProviderElement<ExpiryFilter, ExpiryFilterData>
    with ExpiryFilterRef {
  _ExpiryFilterProviderElement(super.provider);

  @override
  ExpiryType? get lockType => (origin as ExpiryFilterProvider).lockType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
