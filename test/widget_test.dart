// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {});
  test('日期格式',() {
    var dateFormat = DateFormat('y年M月d日');
    var format = dateFormat.format(DateTime.now());
    debugPrint(format);
    var parse = dateFormat.parse('2024年3月10日');
    debugPrint(parse.toString());
    // DateFormat.yMd(value);
  },);
}
