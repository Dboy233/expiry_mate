// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expiry_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpiryItemImpl _$$ExpiryItemImplFromJson(Map<String, dynamic> json) =>
    _$ExpiryItemImpl(
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
      coverPath: json['cover_path'] as String?,
    );

Map<String, dynamic> _$$ExpiryItemImplToJson(_$ExpiryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createDate': instance.createDate?.toIso8601String(),
      'overDate': instance.overDate?.toIso8601String(),
      'safeDays': instance.safeDays,
      'type': instance.type,
      'reminderDays': instance.reminderDays,
      'tag': instance.tag,
      'cover_path': instance.coverPath,
    };
