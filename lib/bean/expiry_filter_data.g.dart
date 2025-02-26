// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expiry_filter_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpiryFilterDataImpl _$$ExpiryFilterDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpiryFilterDataImpl(
      createTimeFirst: json['createTimeFirst'] == null
          ? null
          : DateTime.parse(json['createTimeFirst'] as String),
      createTimeLast: json['createTimeLast'] == null
          ? null
          : DateTime.parse(json['createTimeLast'] as String),
      overDateFirst: json['overDateFirst'] == null
          ? null
          : DateTime.parse(json['overDateFirst'] as String),
      overDateLast: json['overDateLast'] == null
          ? null
          : DateTime.parse(json['overDateLast'] as String),
      lastDays: (json['lastDays'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ExpiryFilterDataImplToJson(
        _$ExpiryFilterDataImpl instance) =>
    <String, dynamic>{
      'createTimeFirst': instance.createTimeFirst?.toIso8601String(),
      'createTimeLast': instance.createTimeLast?.toIso8601String(),
      'overDateFirst': instance.overDateFirst?.toIso8601String(),
      'overDateLast': instance.overDateLast?.toIso8601String(),
      'lastDays': instance.lastDays,
      'type': instance.type,
    };
