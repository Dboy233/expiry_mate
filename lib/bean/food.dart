import 'dart:math';

import 'package:foods_assistant/gen/assets.gen.dart';

///食品信息类
class Food {
  int? id;

  ///名称
  String name;

  ///生产日期
  DateTime productionDate;

  ///保障天数，如果不设置根据invalidTime推断
  ///safeguardDay和expiredTime两个数据二选其一
  int? safeguardDay;

  ///失效时间，如果不设置根据safeguardDay推断
  DateTime? expiredTime;

  ///临期提醒时间，快过期几天前就将食品标记为即将临期
  ///默认三天。
  int reminderDays;

  ///分类
  FoodCategory category;

  Food(
      {required this.name,
      required this.productionDate,
      this.id,
      this.safeguardDay,
      this.expiredTime,
      this.category = FoodCategory.other,
      this.reminderDays = 3}) {
    if (safeguardDay != null && expiredTime == null) {
      expiredTime = productionDate.add(Duration(days: safeguardDay!));
    }
    if (safeguardDay == null && expiredTime != null) {
      assert(productionDate.isAfter(expiredTime!));
      safeguardDay = expiredTime!.difference(productionDate).inDays;
    }
  }

  ///食品剩余保质天数
  int remainingDays() {
    var now = DateTime.now();
    return now.difference(expiredTime!).inDays;
  }

  ///食品是否过期
  bool isExpired() {
    assert(expiredTime != null);
    var now = DateTime.now();
    return now.isBefore(expiredTime!) || remainingDays() == 0;
  }

  @override
  String toString() {
    return 'Food{id: $id, name: $name, productionDate: $productionDate, safeguardDay: $safeguardDay, expiredTime: $expiredTime, reminderDays: $reminderDays, category: $category}';
  }
}

// 定义食物分类的枚举类型
enum FoodCategory {
  /// 谷类及其制品
  grainsAndProducts,

  /// 薯类、淀粉及其制品
  tubersStarchesAndProducts,

  /// 干豆类及其制品
  dryBeansAndProducts,

  /// 蔬菜类及其制品
  vegetablesAndProducts,

  /// 菌藻类
  mushroomsAndAlgae,

  /// 水果类及其制品
  fruitsAndProducts,

  /// 坚果、种子类
  nutsAndSeeds,

  ///肉类
  meat,

  /// 乳类及其制品
  dairyAndProducts,

  /// 蛋类及其制品
  eggsAndProducts,

  /// 休闲食品
  snackFoods,

  /// 饮料和冷饮类
  beveragesAndColdDrinks,

  /// 含酒精饮料
  alcoholicBeverages,

  /// 油脂类
  oilsAndFats,

  /// 调味品类
  seasonings,

  /// 其他（包括以上分类不涵盖的食物品种）
  other;
}

class FoodCategoryHelper {

  static AssetGenImage getCategoryImage(FoodCategory category) {
    return switch (category) {
      FoodCategory.grainsAndProducts => Assets.images.iconGrains,
      FoodCategory.tubersStarchesAndProducts => Assets.images.iconTubers,
      FoodCategory.dryBeansAndProducts => Assets.images.iconDry,
      FoodCategory.vegetablesAndProducts => Assets.images.iconVegetables,
      FoodCategory.mushroomsAndAlgae => Assets.images.iconMushrooms,
      FoodCategory.fruitsAndProducts => Assets.images.iconFruits,
      FoodCategory.nutsAndSeeds => Assets.images.iconNuts,
      FoodCategory.meat => Assets.images.iconMeat,
      FoodCategory.dairyAndProducts => Assets.images.iconDairy,
      FoodCategory.eggsAndProducts => Assets.images.iconEggs,
      FoodCategory.snackFoods => Assets.images.iconSnackFood,
      FoodCategory.beveragesAndColdDrinks => Assets.images.iconBeverages,
      FoodCategory.alcoholicBeverages => Assets.images.iconAlcoholic,
      FoodCategory.oilsAndFats => Assets.images.iconOilsFats,
      FoodCategory.seasonings => Assets.images.iconSeasonings,
      FoodCategory.other => Assets.images.iconOther,
    };
  }

  ///类别枚举名称
  static String getName(FoodCategory category) {
    return switch (category) {
      FoodCategory.grainsAndProducts => '谷物类',
      FoodCategory.tubersStarchesAndProducts => '淀粉及其制品',
      FoodCategory.dryBeansAndProducts => '豆类及其制品',
      FoodCategory.vegetablesAndProducts => '蔬菜及其制品',
      FoodCategory.mushroomsAndAlgae => '菌藻类',
      FoodCategory.fruitsAndProducts => '水果类',
      FoodCategory.nutsAndSeeds => '坚果类',
      FoodCategory.meat => '肉类',
      FoodCategory.dairyAndProducts => '乳制品',
      FoodCategory.eggsAndProducts => '蛋类及其制品',
      FoodCategory.snackFoods => '休闲食品',
      FoodCategory.beveragesAndColdDrinks => '饮料类',
      FoodCategory.alcoholicBeverages => '酒精饮料',
      FoodCategory.oilsAndFats => '油脂类',
      FoodCategory.seasonings => '调味品',
      FoodCategory.other => '其他',
    };
  }

  ///类别种类列举
  static List<String> getExample(FoodCategory category) {
    return switch (category) {
      FoodCategory.grainsAndProducts => ['米饭', '馒头', '面条', '杂粮粥', '饼干'],
      FoodCategory.tubersStarchesAndProducts => [
          '土豆',
          '红薯',
          '山药',
          '木薯粉',
          '红薯粉条'
        ],
      FoodCategory.dryBeansAndProducts => ['黄豆', '绿豆', '红豆', '豆腐', '豆浆'],
      FoodCategory.vegetablesAndProducts => [
          '白菜',
          '菠菜',
          '西红柿',
          '黄瓜',
          '胡萝卜',
          '茄子',
          '西兰花'
        ],
      FoodCategory.mushroomsAndAlgae => ['香菇', '木耳', '海带', '紫菜'],
      FoodCategory.fruitsAndProducts => ['苹果', '香蕉', '橙子', '西瓜', '葡萄', '草莓'],
      FoodCategory.nutsAndSeeds => ['花生', '核桃', '杏仁', '瓜子', '芝麻'],
      FoodCategory.meat => ['猪肉', '牛肉', '羊肉', '鸡肉', '鸭肉'],
      FoodCategory.dairyAndProducts => ['牛奶', '酸奶', '奶酪', '黄油'],
      FoodCategory.eggsAndProducts => ['鸡蛋', '鸭蛋', '鹌鹑蛋', '皮蛋'],
      FoodCategory.snackFoods => ['薯片', '巧克力', '糖果', '爆米花', '饼干'],
      FoodCategory.beveragesAndColdDrinks => ['果汁', '汽水', '茶', '咖啡', '冰淇淋'],
      FoodCategory.alcoholicBeverages => ['啤酒', '白酒', '红酒', '黄酒'],
      FoodCategory.oilsAndFats => ['花生油', '豆油', '菜籽油', '橄榄油', '猪油'],
      FoodCategory.seasonings => ['盐', '酱油', '醋', '糖', '鸡精', '味精'],
      FoodCategory.other => ['预制菜', '速食粥', '方便米粉', '方便面'],
    };
  }
}

// 辅助函数：生成随机食品分类
FoodCategory randomCategory() {
  final categories = FoodCategory.values;
  return categories[Random().nextInt(categories.length)];
}

// 生成假数据
List<Food> generateFakeFoods(int count) {
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

  List<Food> foods = [];
  final productionDate = DateTime(2025, 1, 1); // 生产日期固定在2025年1月
  final minExpired = DateTime(2025, 2, 15);
  final maxExpired = DateTime(2025, 3, 15);

  for (int i = 0; i < count; i++) {
    // 随机选择保质期天数，确保过期时间在minExpired和maxExpired之间
    int minDays = (minExpired.difference(productionDate)).inDays;
    int maxDays = (maxExpired.difference(productionDate)).inDays;
    int safeguardDay = Random().nextInt(maxDays - minDays + 1) + minDays;
    int reminderDays = Random().nextInt(15) + 1;
    var foodName = foodNames[Random().nextInt(foodNames.length)];
    foodNames.remove(foodName);
    Food food = Food(
        name: foodName,
        productionDate: productionDate,
        safeguardDay: safeguardDay,
        category: randomCategory(),
        reminderDays: reminderDays);
    print(food);
    foods.add(food);
  }

  return foods;
}
