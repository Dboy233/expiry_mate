import 'package:objectbox/objectbox.dart';

@Entity()
class FoodCollection {
  @Id()
  int? id;

  ///名称
  String name;

  ///生产日期
  @Property(type: PropertyType.date)
  DateTime productionDate;

  ///过期日期
  @Property(type: PropertyType.date)
  DateTime expiredDate;

  ///保质天数,其实就是过期日期与生产日期的差值
  int safeguardDay;

  ///分类
  int category;

  ///提醒天数，还剩多久的时候进行提醒即将临期,
  ///当保质日期天数与现在相差的天数小于等于reminderDays的时候
  ///此食物就是即将临期食品。
  int reminderDays;

  FoodCollection({
    required this.name,
    required this.productionDate,
    required this.category,
    required this.safeguardDay,
    required this.expiredDate,
    this.reminderDays = 7,
  });
}
