// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expiry_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpiryItem _$ExpiryItemFromJson(Map<String, dynamic> json) {
  return _ExpiryItem.fromJson(json);
}

/// @nodoc
mixin _$ExpiryItem {
  ///唯一id
  @JsonKey(name: 'id')
  @Id()
  int? get id => throw _privateConstructorUsedError;

  ///唯一id
  @JsonKey(name: 'id')
  @Id()
  set id(int? value) => throw _privateConstructorUsedError;

  ///名称
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  ///名称
  @JsonKey(name: 'name')
  set name(String? value) => throw _privateConstructorUsedError;

  ///生产日期
  @JsonKey(name: 'createDate')
  @Property(type: PropertyType.date)
  DateTime? get createDate => throw _privateConstructorUsedError;

  ///生产日期
  @JsonKey(name: 'createDate')
  @Property(type: PropertyType.date)
  set createDate(DateTime? value) => throw _privateConstructorUsedError;

  ///保质截至日期,overDate
  @JsonKey(name: 'overDate')
  @Property(type: PropertyType.date)
  DateTime? get overDate => throw _privateConstructorUsedError;

  ///保质截至日期,overDate
  @JsonKey(name: 'overDate')
  @Property(type: PropertyType.date)
  set overDate(DateTime? value) => throw _privateConstructorUsedError;

  ///保质天数（保质期-生产期日期）
  @JsonKey(name: 'safeDays')
  int? get safeDays => throw _privateConstructorUsedError;

  ///保质天数（保质期-生产期日期）
  @JsonKey(name: 'safeDays')
  set safeDays(int? value) => throw _privateConstructorUsedError;

  ///分类
  @JsonKey(name: 'type')
  int? get type => throw _privateConstructorUsedError;

  ///分类
  @JsonKey(name: 'type')
  set type(int? value) => throw _privateConstructorUsedError;

  ///距离多久过期开始提醒
  @JsonKey(name: 'reminderDays')
  int? get reminderDays => throw _privateConstructorUsedError;

  ///距离多久过期开始提醒
  @JsonKey(name: 'reminderDays')
  set reminderDays(int? value) => throw _privateConstructorUsedError;

  ///标签
  @JsonKey(name: 'tag')
  String? get tag => throw _privateConstructorUsedError;

  ///标签
  @JsonKey(name: 'tag')
  set tag(String? value) => throw _privateConstructorUsedError;

  /// Serializes this ExpiryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpiryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpiryItemCopyWith<ExpiryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpiryItemCopyWith<$Res> {
  factory $ExpiryItemCopyWith(
          ExpiryItem value, $Res Function(ExpiryItem) then) =
      _$ExpiryItemCopyWithImpl<$Res, ExpiryItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @Id() int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'createDate')
      @Property(type: PropertyType.date)
      DateTime? createDate,
      @JsonKey(name: 'overDate')
      @Property(type: PropertyType.date)
      DateTime? overDate,
      @JsonKey(name: 'safeDays') int? safeDays,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'reminderDays') int? reminderDays,
      @JsonKey(name: 'tag') String? tag});
}

/// @nodoc
class _$ExpiryItemCopyWithImpl<$Res, $Val extends ExpiryItem>
    implements $ExpiryItemCopyWith<$Res> {
  _$ExpiryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpiryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createDate = freezed,
    Object? overDate = freezed,
    Object? safeDays = freezed,
    Object? type = freezed,
    Object? reminderDays = freezed,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overDate: freezed == overDate
          ? _value.overDate
          : overDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      safeDays: freezed == safeDays
          ? _value.safeDays
          : safeDays // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      reminderDays: freezed == reminderDays
          ? _value.reminderDays
          : reminderDays // ignore: cast_nullable_to_non_nullable
              as int?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpiryItemImplCopyWith<$Res>
    implements $ExpiryItemCopyWith<$Res> {
  factory _$$ExpiryItemImplCopyWith(
          _$ExpiryItemImpl value, $Res Function(_$ExpiryItemImpl) then) =
      __$$ExpiryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @Id() int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'createDate')
      @Property(type: PropertyType.date)
      DateTime? createDate,
      @JsonKey(name: 'overDate')
      @Property(type: PropertyType.date)
      DateTime? overDate,
      @JsonKey(name: 'safeDays') int? safeDays,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'reminderDays') int? reminderDays,
      @JsonKey(name: 'tag') String? tag});
}

/// @nodoc
class __$$ExpiryItemImplCopyWithImpl<$Res>
    extends _$ExpiryItemCopyWithImpl<$Res, _$ExpiryItemImpl>
    implements _$$ExpiryItemImplCopyWith<$Res> {
  __$$ExpiryItemImplCopyWithImpl(
      _$ExpiryItemImpl _value, $Res Function(_$ExpiryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpiryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createDate = freezed,
    Object? overDate = freezed,
    Object? safeDays = freezed,
    Object? type = freezed,
    Object? reminderDays = freezed,
    Object? tag = freezed,
  }) {
    return _then(_$ExpiryItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overDate: freezed == overDate
          ? _value.overDate
          : overDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      safeDays: freezed == safeDays
          ? _value.safeDays
          : safeDays // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      reminderDays: freezed == reminderDays
          ? _value.reminderDays
          : reminderDays // ignore: cast_nullable_to_non_nullable
              as int?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Entity(realClass: ExpiryItem)
class _$ExpiryItemImpl implements _ExpiryItem {
  _$ExpiryItemImpl(
      {@JsonKey(name: 'id') @Id() this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'createDate')
      @Property(type: PropertyType.date)
      this.createDate,
      @JsonKey(name: 'overDate')
      @Property(type: PropertyType.date)
      this.overDate,
      @JsonKey(name: 'safeDays') this.safeDays,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'reminderDays') this.reminderDays,
      @JsonKey(name: 'tag') this.tag});

  factory _$ExpiryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiryItemImplFromJson(json);

  ///唯一id
  @override
  @JsonKey(name: 'id')
  @Id()
  int? id;

  ///名称
  @override
  @JsonKey(name: 'name')
  String? name;

  ///生产日期
  @override
  @JsonKey(name: 'createDate')
  @Property(type: PropertyType.date)
  DateTime? createDate;

  ///保质截至日期,overDate
  @override
  @JsonKey(name: 'overDate')
  @Property(type: PropertyType.date)
  DateTime? overDate;

  ///保质天数（保质期-生产期日期）
  @override
  @JsonKey(name: 'safeDays')
  int? safeDays;

  ///分类
  @override
  @JsonKey(name: 'type')
  int? type;

  ///距离多久过期开始提醒
  @override
  @JsonKey(name: 'reminderDays')
  int? reminderDays;

  ///标签
  @override
  @JsonKey(name: 'tag')
  String? tag;

  @override
  String toString() {
    return 'ExpiryItem(id: $id, name: $name, createDate: $createDate, overDate: $overDate, safeDays: $safeDays, type: $type, reminderDays: $reminderDays, tag: $tag)';
  }

  /// Create a copy of ExpiryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpiryItemImplCopyWith<_$ExpiryItemImpl> get copyWith =>
      __$$ExpiryItemImplCopyWithImpl<_$ExpiryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiryItemImplToJson(
      this,
    );
  }
}

abstract class _ExpiryItem implements ExpiryItem {
  factory _ExpiryItem(
      {@JsonKey(name: 'id') @Id() int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'createDate')
      @Property(type: PropertyType.date)
      DateTime? createDate,
      @JsonKey(name: 'overDate')
      @Property(type: PropertyType.date)
      DateTime? overDate,
      @JsonKey(name: 'safeDays') int? safeDays,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'reminderDays') int? reminderDays,
      @JsonKey(name: 'tag') String? tag}) = _$ExpiryItemImpl;

  factory _ExpiryItem.fromJson(Map<String, dynamic> json) =
      _$ExpiryItemImpl.fromJson;

  ///唯一id
  @override
  @JsonKey(name: 'id')
  @Id()
  int? get id;

  ///唯一id
  @JsonKey(name: 'id')
  @Id()
  set id(int? value);

  ///名称
  @override
  @JsonKey(name: 'name')
  String? get name;

  ///名称
  @JsonKey(name: 'name')
  set name(String? value);

  ///生产日期
  @override
  @JsonKey(name: 'createDate')
  @Property(type: PropertyType.date)
  DateTime? get createDate;

  ///生产日期
  @JsonKey(name: 'createDate')
  @Property(type: PropertyType.date)
  set createDate(DateTime? value);

  ///保质截至日期,overDate
  @override
  @JsonKey(name: 'overDate')
  @Property(type: PropertyType.date)
  DateTime? get overDate;

  ///保质截至日期,overDate
  @JsonKey(name: 'overDate')
  @Property(type: PropertyType.date)
  set overDate(DateTime? value);

  ///保质天数（保质期-生产期日期）
  @override
  @JsonKey(name: 'safeDays')
  int? get safeDays;

  ///保质天数（保质期-生产期日期）
  @JsonKey(name: 'safeDays')
  set safeDays(int? value);

  ///分类
  @override
  @JsonKey(name: 'type')
  int? get type;

  ///分类
  @JsonKey(name: 'type')
  set type(int? value);

  ///距离多久过期开始提醒
  @override
  @JsonKey(name: 'reminderDays')
  int? get reminderDays;

  ///距离多久过期开始提醒
  @JsonKey(name: 'reminderDays')
  set reminderDays(int? value);

  ///标签
  @override
  @JsonKey(name: 'tag')
  String? get tag;

  ///标签
  @JsonKey(name: 'tag')
  set tag(String? value);

  /// Create a copy of ExpiryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpiryItemImplCopyWith<_$ExpiryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
