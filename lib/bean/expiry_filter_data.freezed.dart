// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expiry_filter_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpiryFilterData _$ExpiryFilterDataFromJson(Map<String, dynamic> json) {
  return _ExpiryFilterData.fromJson(json);
}

/// @nodoc
mixin _$ExpiryFilterData {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  set name(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'createDateStart')
  DateTime? get createDateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'createDateStart')
  set createDateStart(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'createDateEnd')
  DateTime? get createDateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'createDateEnd')
  set createDateEnd(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'overDateStart')
  DateTime? get overDateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'overDateStart')
  set overDateStart(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'overDateEnd')
  DateTime? get overDateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'overDateEnd')
  set overDateEnd(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastDays')
  int? get lastDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastDays')
  set lastDays(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  set type(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'isExpiry')
  bool? get isExpiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'isExpiry')
  set isExpiry(bool? value) => throw _privateConstructorUsedError;

  /// Serializes this ExpiryFilterData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpiryFilterData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpiryFilterDataCopyWith<ExpiryFilterData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpiryFilterDataCopyWith<$Res> {
  factory $ExpiryFilterDataCopyWith(
          ExpiryFilterData value, $Res Function(ExpiryFilterData) then) =
      _$ExpiryFilterDataCopyWithImpl<$Res, ExpiryFilterData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'createDateStart') DateTime? createDateStart,
      @JsonKey(name: 'createDateEnd') DateTime? createDateEnd,
      @JsonKey(name: 'overDateStart') DateTime? overDateStart,
      @JsonKey(name: 'overDateEnd') DateTime? overDateEnd,
      @JsonKey(name: 'lastDays') int? lastDays,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'isExpiry') bool? isExpiry});
}

/// @nodoc
class _$ExpiryFilterDataCopyWithImpl<$Res, $Val extends ExpiryFilterData>
    implements $ExpiryFilterDataCopyWith<$Res> {
  _$ExpiryFilterDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpiryFilterData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? createDateStart = freezed,
    Object? createDateEnd = freezed,
    Object? overDateStart = freezed,
    Object? overDateEnd = freezed,
    Object? lastDays = freezed,
    Object? type = freezed,
    Object? isExpiry = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createDateStart: freezed == createDateStart
          ? _value.createDateStart
          : createDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createDateEnd: freezed == createDateEnd
          ? _value.createDateEnd
          : createDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overDateStart: freezed == overDateStart
          ? _value.overDateStart
          : overDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overDateEnd: freezed == overDateEnd
          ? _value.overDateEnd
          : overDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastDays: freezed == lastDays
          ? _value.lastDays
          : lastDays // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      isExpiry: freezed == isExpiry
          ? _value.isExpiry
          : isExpiry // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpiryFilterDataImplCopyWith<$Res>
    implements $ExpiryFilterDataCopyWith<$Res> {
  factory _$$ExpiryFilterDataImplCopyWith(_$ExpiryFilterDataImpl value,
          $Res Function(_$ExpiryFilterDataImpl) then) =
      __$$ExpiryFilterDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'createDateStart') DateTime? createDateStart,
      @JsonKey(name: 'createDateEnd') DateTime? createDateEnd,
      @JsonKey(name: 'overDateStart') DateTime? overDateStart,
      @JsonKey(name: 'overDateEnd') DateTime? overDateEnd,
      @JsonKey(name: 'lastDays') int? lastDays,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'isExpiry') bool? isExpiry});
}

/// @nodoc
class __$$ExpiryFilterDataImplCopyWithImpl<$Res>
    extends _$ExpiryFilterDataCopyWithImpl<$Res, _$ExpiryFilterDataImpl>
    implements _$$ExpiryFilterDataImplCopyWith<$Res> {
  __$$ExpiryFilterDataImplCopyWithImpl(_$ExpiryFilterDataImpl _value,
      $Res Function(_$ExpiryFilterDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpiryFilterData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? createDateStart = freezed,
    Object? createDateEnd = freezed,
    Object? overDateStart = freezed,
    Object? overDateEnd = freezed,
    Object? lastDays = freezed,
    Object? type = freezed,
    Object? isExpiry = freezed,
  }) {
    return _then(_$ExpiryFilterDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createDateStart: freezed == createDateStart
          ? _value.createDateStart
          : createDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createDateEnd: freezed == createDateEnd
          ? _value.createDateEnd
          : createDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overDateStart: freezed == overDateStart
          ? _value.overDateStart
          : overDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overDateEnd: freezed == overDateEnd
          ? _value.overDateEnd
          : overDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastDays: freezed == lastDays
          ? _value.lastDays
          : lastDays // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      isExpiry: freezed == isExpiry
          ? _value.isExpiry
          : isExpiry // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpiryFilterDataImpl implements _ExpiryFilterData {
  _$ExpiryFilterDataImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'createDateStart') this.createDateStart,
      @JsonKey(name: 'createDateEnd') this.createDateEnd,
      @JsonKey(name: 'overDateStart') this.overDateStart,
      @JsonKey(name: 'overDateEnd') this.overDateEnd,
      @JsonKey(name: 'lastDays') this.lastDays,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'isExpiry') this.isExpiry});

  factory _$ExpiryFilterDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiryFilterDataImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  String? name;
  @override
  @JsonKey(name: 'createDateStart')
  DateTime? createDateStart;
  @override
  @JsonKey(name: 'createDateEnd')
  DateTime? createDateEnd;
  @override
  @JsonKey(name: 'overDateStart')
  DateTime? overDateStart;
  @override
  @JsonKey(name: 'overDateEnd')
  DateTime? overDateEnd;
  @override
  @JsonKey(name: 'lastDays')
  int? lastDays;
  @override
  @JsonKey(name: 'type')
  int? type;
  @override
  @JsonKey(name: 'isExpiry')
  bool? isExpiry;

  @override
  String toString() {
    return 'ExpiryFilterData(name: $name, createDateStart: $createDateStart, createDateEnd: $createDateEnd, overDateStart: $overDateStart, overDateEnd: $overDateEnd, lastDays: $lastDays, type: $type, isExpiry: $isExpiry)';
  }

  /// Create a copy of ExpiryFilterData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpiryFilterDataImplCopyWith<_$ExpiryFilterDataImpl> get copyWith =>
      __$$ExpiryFilterDataImplCopyWithImpl<_$ExpiryFilterDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiryFilterDataImplToJson(
      this,
    );
  }
}

abstract class _ExpiryFilterData implements ExpiryFilterData {
  factory _ExpiryFilterData(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'createDateStart') DateTime? createDateStart,
      @JsonKey(name: 'createDateEnd') DateTime? createDateEnd,
      @JsonKey(name: 'overDateStart') DateTime? overDateStart,
      @JsonKey(name: 'overDateEnd') DateTime? overDateEnd,
      @JsonKey(name: 'lastDays') int? lastDays,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'isExpiry') bool? isExpiry}) = _$ExpiryFilterDataImpl;

  factory _ExpiryFilterData.fromJson(Map<String, dynamic> json) =
      _$ExpiryFilterDataImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @JsonKey(name: 'name')
  set name(String? value);
  @override
  @JsonKey(name: 'createDateStart')
  DateTime? get createDateStart;
  @JsonKey(name: 'createDateStart')
  set createDateStart(DateTime? value);
  @override
  @JsonKey(name: 'createDateEnd')
  DateTime? get createDateEnd;
  @JsonKey(name: 'createDateEnd')
  set createDateEnd(DateTime? value);
  @override
  @JsonKey(name: 'overDateStart')
  DateTime? get overDateStart;
  @JsonKey(name: 'overDateStart')
  set overDateStart(DateTime? value);
  @override
  @JsonKey(name: 'overDateEnd')
  DateTime? get overDateEnd;
  @JsonKey(name: 'overDateEnd')
  set overDateEnd(DateTime? value);
  @override
  @JsonKey(name: 'lastDays')
  int? get lastDays;
  @JsonKey(name: 'lastDays')
  set lastDays(int? value);
  @override
  @JsonKey(name: 'type')
  int? get type;
  @JsonKey(name: 'type')
  set type(int? value);
  @override
  @JsonKey(name: 'isExpiry')
  bool? get isExpiry;
  @JsonKey(name: 'isExpiry')
  set isExpiry(bool? value);

  /// Create a copy of ExpiryFilterData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpiryFilterDataImplCopyWith<_$ExpiryFilterDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
