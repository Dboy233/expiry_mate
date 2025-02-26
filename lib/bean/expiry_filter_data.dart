import 'package:freezed_annotation/freezed_annotation.dart';

part 'expiry_filter_data.freezed.dart';
part 'expiry_filter_data.g.dart';

@unfreezed
class ExpiryFilterData with _$ExpiryFilterData {
  factory ExpiryFilterData({
    @JsonKey(name: 'createTimeFirst') DateTime? createTimeFirst,
    @JsonKey(name: 'createTimeLast') DateTime? createTimeLast,
    @JsonKey(name: 'overDateFirst') DateTime? overDateFirst,
    @JsonKey(name: 'overDateLast') DateTime? overDateLast,
    @JsonKey(name: 'lastDays') int? lastDays,
    @JsonKey(name: 'type') int? type,
  }) = _ExpiryFilterData;

  factory ExpiryFilterData.fromJson(Map<String, Object?> json) =>
      _$ExpiryFilterDataFromJson(json);
}
