import 'dart:math';

import 'package:foods_assistant/db/data/food_type.dart';
import 'package:foods_assistant/db/data/food.dart';

class FakeDataGen{

// 辅助函数：生成随机食品分类
 static FoodType randomCategory() {
    final categories = FoodType.values;
    return categories[Random().nextInt(categories.length)];
  }

// 生成假数据
 static List<Foods> generateFakeFoods(int count) {
// 辅助函数：生成随机食品名称
    List<String> foodNames = [
      '苹果',
      '牛奶',
      '面包',
      '大米',
      '鸡蛋',
      '牛肉',
      '橙子',
      '酸奶',
      '面条',
      '鸡肉',
      '薯片',
      '啤酒',
      '花生油',
      '酱油',
      '巧克力',
      '蔬菜沙拉',
      '坚果混合',
      '果汁',
      '咖啡',
      '饼干',
    ];

    List<Foods> foods = [];
    final productionDate = DateTime(2025, 1, 1); // 生产日期固定在2025年1月
    final minExpired = DateTime(2025, 2, 0);
    final maxExpired = DateTime(2025, 3, 15);

    for (int i = 0; i < count; i++) {
      // 随机选择保质期天数，确保过期时间在minExpired和maxExpired之间
      int minDays = (minExpired.difference(productionDate)).inDays;
      int maxDays = (maxExpired.difference(productionDate)).inDays;
      int safeguardDay = Random().nextInt(maxDays - minDays + 1) + minDays;
      int reminderDays = Random().nextInt(15) + 1;
      var foodName = foodNames[Random().nextInt(foodNames.length)];
      foodNames.remove(foodName);
      Foods food = Foods(
          name: foodName,
          createDate: productionDate,
          overDate: productionDate.add(Duration(days: safeguardDay)),
          safeDays: safeguardDay,
          type: randomCategory().index,
          reminderDays: reminderDays,
      );
      foods.add(food);
    }

    return foods;
  }


}