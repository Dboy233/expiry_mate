import 'package:expiry_mate/ext/date_ext.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'expiry_item.freezed.dart';
part 'expiry_item.g.dart';

@unfreezed
class ExpiryItem with _$ExpiryItem {
  @Entity(realClass: ExpiryItem)
  factory ExpiryItem({
    ///唯一id
    @JsonKey(name: 'id') @Id() int? id,

    ///名称
    @JsonKey(name: 'name') String? name,

    ///生产日期
    @JsonKey(name: 'createDate')
    @Property(type: PropertyType.date)
    DateTime? createDate,

    ///保质截至日期,overDate
    @JsonKey(name: 'overDate')
    @Property(type: PropertyType.date)
    DateTime? overDate,

    ///保质天数（保质期-生产期日期）
    @JsonKey(name: 'safeDays') int? safeDays,

    ///分类
    @JsonKey(name: 'type') int? type,

    ///距离多久过期开始提醒
    @JsonKey(name: 'reminderDays') int? reminderDays,

    ///标签
    @JsonKey(name: 'tag') String? tag,
  }) = _ExpiryItem;

  factory ExpiryItem.fromJson(Map<String, Object?> json) => _$ExpiryItemFromJson(json);
}


extension ExpiryItemExtension on ExpiryItem {
  ///食品是否过期
  bool? isExpired() {
    var now = DateTime.now();
    if (overDate != null) {
      return now.isBefore(overDate!);
    }
    return null;
  }

  ///是否需要提醒
  bool isNeedReminder() {
    if (reminderDays == null || overDate == null) {
      return false;
    }
    var before = overDate!.subtract(Duration(days: reminderDays!));
    var now = DateTime.now();
    return now.isBetweenC(before, overDate!);
  }

  ///获取需要提醒的日期
  DateTime? getReminderDate(){
    if (reminderDays == null || overDate == null) {
      return null;
    }
     return overDate!.subtract(Duration(days: reminderDays!));
  }
}
