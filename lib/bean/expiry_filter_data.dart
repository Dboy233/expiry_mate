import 'package:freezed_annotation/freezed_annotation.dart';

part 'expiry_filter_data.freezed.dart';
part 'expiry_filter_data.g.dart';

@unfreezed
class ExpiryFilterData with _$ExpiryFilterData {
  factory ExpiryFilterData({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'createDateStart') DateTime? createDateStart,
    @JsonKey(name: 'createDateEnd') DateTime? createDateEnd,
    @JsonKey(name: 'overDateStart') DateTime? overDateStart,
    @JsonKey(name: 'overDateEnd') DateTime? overDateEnd,
    @JsonKey(name: 'lastDays') int? lastDays,
    @JsonKey(name: 'type') int? type,
    @JsonKey(name: 'isExpiry') bool? isExpiry,
  }) = _ExpiryFilterData;

  factory ExpiryFilterData.fromJson(Map<String, Object?> json) =>
      _$ExpiryFilterDataFromJson(json);
}


extension ExpiryFilterExt on ExpiryFilterData{
  void clear(){
    name =null;
    createDateStart =null;
    createDateEnd = null;
    overDateStart = null;
    overDateEnd = null;
    lastDays= null;
    type = null;
    isExpiry = null;
  }
}