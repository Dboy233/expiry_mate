// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expiry_filter_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpiryFilterDataImpl _$$ExpiryFilterDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpiryFilterDataImpl(
      name: json['name'] as String?,
      createDateStart: json['createDateStart'] == null
          ? null
          : DateTime.parse(json['createDateStart'] as String),
      createDateEnd: json['createDateEnd'] == null
          ? null
          : DateTime.parse(json['createDateEnd'] as String),
      overDateStart: json['overDateStart'] == null
          ? null
          : DateTime.parse(json['overDateStart'] as String),
      overDateEnd: json['overDateEnd'] == null
          ? null
          : DateTime.parse(json['overDateEnd'] as String),
      lastDays: (json['lastDays'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
      isExpiry: json['isExpiry'] as bool?,
    );

Map<String, dynamic> _$$ExpiryFilterDataImplToJson(
        _$ExpiryFilterDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'createDateStart': instance.createDateStart?.toIso8601String(),
      'createDateEnd': instance.createDateEnd?.toIso8601String(),
      'overDateStart': instance.overDateStart?.toIso8601String(),
      'overDateEnd': instance.overDateEnd?.toIso8601String(),
      'lastDays': instance.lastDays,
      'type': instance.type,
      'isExpiry': instance.isExpiry,
    };
