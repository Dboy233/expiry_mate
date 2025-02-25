// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodsImpl _$$FoodsImplFromJson(Map<String, dynamic> json) => _$FoodsImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      overDate: json['overDate'] == null
          ? null
          : DateTime.parse(json['overDate'] as String),
      safeDays: (json['safeDays'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
      reminderDays: (json['reminderDays'] as num?)?.toInt(),
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$FoodsImplToJson(_$FoodsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createDate': instance.createDate?.toIso8601String(),
      'overDate': instance.overDate?.toIso8601String(),
      'safeDays': instance.safeDays,
      'type': instance.type,
      'reminderDays': instance.reminderDays,
      'tag': instance.tag,
    };
