import 'package:date_time_format/date_time_format.dart';

extension DateExt on DateTime {
  ///判断此时间是否在before和after之间，开区间，相等了不属于。
  bool isBetween(DateTime before, DateTime after) {
    return isAfter(before) && isBefore(after);
  }

  ///判断此时间是否在before和after的闭区间，如果这个时间和两个任意时间日期和时间相等就算是在两者之间
  bool isBetweenC(DateTime before, DateTime after) {
    if (isBetween(before, after)) {
      return true;
    }
    if (before.day == day || after.day == day) {
      return true;
    }
    if (before.hour == hour || after.hour == hour) {
      return true;
    }
    return false;
  }

  String formatCn(){
    return format(r'Y年m月d日');
  }
}
