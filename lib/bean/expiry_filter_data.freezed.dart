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
  @JsonKey(name: 'createTimeFirst')
  DateTime? get createTimeFirst => throw _privateConstructorUsedError;
  @JsonKey(name: 'createTimeFirst')
  set createTimeFirst(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'createTimeLast')
  DateTime? get createTimeLast => throw _privateConstructorUsedError;
  @JsonKey(name: 'createTimeLast')
  set createTimeLast(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'overDateFirst')
  DateTime? get overDateFirst => throw _privateConstructorUsedError;
  @JsonKey(name: 'overDateFirst')
  set overDateFirst(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'overDateLast')
  DateTime? get overDateLast => throw _privateConstructorUsedError;
  @JsonKey(name: 'overDateLast')
  set overDateLast(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastDays')
  int? get lastDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastDays')
  set lastDays(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  set type(int? value) => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'createTimeFirst') DateTime? createTimeFirst,
      @JsonKey(name: 'createTimeLast') DateTime? createTimeLast,
      @JsonKey(name: 'overDateFirst') DateTime? overDateFirst,
      @JsonKey(name: 'overDateLast') DateTime? overDateLast,
      @JsonKey(name: 'lastDays') int? lastDays,
      @JsonKey(name: 'type') int? type});
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
    Object? createTimeFirst = freezed,
    Object? createTimeLast = freezed,
    Object? overDateFirst = freezed,
    Object? overDateLast = freezed,
    Object? lastDays = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      createTimeFirst: freezed == createTimeFirst
          ? _value.createTimeFirst
          : createTimeFirst // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createTimeLast: freezed == createTimeLast
          ? _value.createTimeLast
          : createTimeLast // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overDateFirst: freezed == overDateFirst
          ? _value.overDateFirst
          : overDateFirst // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overDateLast: freezed == overDateLast
          ? _value.overDateLast
          : overDateLast // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastDays: freezed == lastDays
          ? _value.lastDays
          : lastDays // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {@JsonKey(name: 'createTimeFirst') DateTime? createTimeFirst,
      @JsonKey(name: 'createTimeLast') DateTime? createTimeLast,
      @JsonKey(name: 'overDateFirst') DateTime? overDateFirst,
      @JsonKey(name: 'overDateLast') DateTime? overDateLast,
      @JsonKey(name: 'lastDays') int? lastDays,
      @JsonKey(name: 'type') int? type});
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
    Object? createTimeFirst = freezed,
    Object? createTimeLast = freezed,
    Object? overDateFirst = freezed,
    Object? overDateLast = freezed,
    Object? lastDays = freezed,
    Object? type = freezed,
  }) {
    return _then(_$ExpiryFilterDataImpl(
      createTimeFirst: freezed == createTimeFirst
          ? _value.createTimeFirst
          : createTimeFirst // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createTimeLast: freezed == createTimeLast
          ? _value.createTimeLast
          : createTimeLast // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overDateFirst: freezed == overDateFirst
          ? _value.overDateFirst
          : overDateFirst // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overDateLast: freezed == overDateLast
          ? _value.overDateLast
          : overDateLast // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastDays: freezed == lastDays
          ? _value.lastDays
          : lastDays // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpiryFilterDataImpl implements _ExpiryFilterData {
  _$ExpiryFilterDataImpl(
      {@JsonKey(name: 'createTimeFirst') this.createTimeFirst,
      @JsonKey(name: 'createTimeLast') this.createTimeLast,
      @JsonKey(name: 'overDateFirst') this.overDateFirst,
      @JsonKey(name: 'overDateLast') this.overDateLast,
      @JsonKey(name: 'lastDays') this.lastDays,
      @JsonKey(name: 'type') this.type});

  factory _$ExpiryFilterDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiryFilterDataImplFromJson(json);

  @override
  @JsonKey(name: 'createTimeFirst')
  DateTime? createTimeFirst;
  @override
  @JsonKey(name: 'createTimeLast')
  DateTime? createTimeLast;
  @override
  @JsonKey(name: 'overDateFirst')
  DateTime? overDateFirst;
  @override
  @JsonKey(name: 'overDateLast')
  DateTime? overDateLast;
  @override
  @JsonKey(name: 'lastDays')
  int? lastDays;
  @override
  @JsonKey(name: 'type')
  int? type;

  @override
  String toString() {
    return 'ExpiryFilterData(createTimeFirst: $createTimeFirst, createTimeLast: $createTimeLast, overDateFirst: $overDateFirst, overDateLast: $overDateLast, lastDays: $lastDays, type: $type)';
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
      {@JsonKey(name: 'createTimeFirst') DateTime? createTimeFirst,
      @JsonKey(name: 'createTimeLast') DateTime? createTimeLast,
      @JsonKey(name: 'overDateFirst') DateTime? overDateFirst,
      @JsonKey(name: 'overDateLast') DateTime? overDateLast,
      @JsonKey(name: 'lastDays') int? lastDays,
      @JsonKey(name: 'type') int? type}) = _$ExpiryFilterDataImpl;

  factory _ExpiryFilterData.fromJson(Map<String, dynamic> json) =
      _$ExpiryFilterDataImpl.fromJson;

  @override
  @JsonKey(name: 'createTimeFirst')
  DateTime? get createTimeFirst;
  @JsonKey(name: 'createTimeFirst')
  set createTimeFirst(DateTime? value);
  @override
  @JsonKey(name: 'createTimeLast')
  DateTime? get createTimeLast;
  @JsonKey(name: 'createTimeLast')
  set createTimeLast(DateTime? value);
  @override
  @JsonKey(name: 'overDateFirst')
  DateTime? get overDateFirst;
  @JsonKey(name: 'overDateFirst')
  set overDateFirst(DateTime? value);
  @override
  @JsonKey(name: 'overDateLast')
  DateTime? get overDateLast;
  @JsonKey(name: 'overDateLast')
  set overDateLast(DateTime? value);
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

  /// Create a copy of ExpiryFilterData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpiryFilterDataImplCopyWith<_$ExpiryFilterDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
