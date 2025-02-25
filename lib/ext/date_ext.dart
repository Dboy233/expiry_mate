extension DateExt on DateTime {
  ///判断此时间是否在before和after之间，开区间，相等了不属于。
  bool isBetween(DateTime before, DateTime after) {
    return before.isBefore(this) && isAfter(after);
  }

  ///判断此时间是否在before和after的闭区间，如果这个时间和两个任意时间日期和时间相等就算是在两者之间
  bool isBetweenC(DateTime before, DateTime after) {
    if (isBetween(before, after)) {
      return true;
    }
    if (before.hour == hour || after.hour == hour) {
      return true;
    }
    if (before.day == day || after.day == day) {
      return true;
    }
    return false;
  }
}
