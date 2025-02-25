// 定义食物分类的枚举类型
import '../../gen/assets.gen.dart';

enum FoodType {
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

extension FoodTypeExt on FoodType {
  ///获取类型icon资源
  AssetGenImage getIconAsset() {
    return switch (this) {
      FoodType.grainsAndProducts => Assets.images.iconGrains,
      FoodType.tubersStarchesAndProducts => Assets.images.iconTubers,
      FoodType.dryBeansAndProducts => Assets.images.iconDry,
      FoodType.vegetablesAndProducts => Assets.images.iconVegetables,
      FoodType.mushroomsAndAlgae => Assets.images.iconMushrooms,
      FoodType.fruitsAndProducts => Assets.images.iconFruits,
      FoodType.nutsAndSeeds => Assets.images.iconNuts,
      FoodType.meat => Assets.images.iconMeat,
      FoodType.dairyAndProducts => Assets.images.iconDairy,
      FoodType.eggsAndProducts => Assets.images.iconEggs,
      FoodType.snackFoods => Assets.images.iconSnackFood,
      FoodType.beveragesAndColdDrinks => Assets.images.iconBeverages,
      FoodType.alcoholicBeverages => Assets.images.iconAlcoholic,
      FoodType.oilsAndFats => Assets.images.iconOilsFats,
      FoodType.seasonings => Assets.images.iconSeasonings,
      FoodType.other => Assets.images.iconOther,
    };
  }

  ///类别枚举名称
  String getTypeName() {
    return switch (this) {
      FoodType.grainsAndProducts => '谷物类',
      FoodType.tubersStarchesAndProducts => '淀粉及其制品',
      FoodType.dryBeansAndProducts => '豆类及其制品',
      FoodType.vegetablesAndProducts => '蔬菜及其制品',
      FoodType.mushroomsAndAlgae => '菌藻类',
      FoodType.fruitsAndProducts => '水果类',
      FoodType.nutsAndSeeds => '坚果类',
      FoodType.meat => '肉类',
      FoodType.dairyAndProducts => '乳制品',
      FoodType.eggsAndProducts => '蛋类及其制品',
      FoodType.snackFoods => '休闲食品',
      FoodType.beveragesAndColdDrinks => '饮料类',
      FoodType.alcoholicBeverages => '酒精饮料',
      FoodType.oilsAndFats => '油脂类',
      FoodType.seasonings => '调味品',
      FoodType.other => '其他',
    };
  }

  ///类别种类列举
  List<String> getExample() {
    return switch (this) {
      FoodType.grainsAndProducts => ['米饭', '馒头', '面条', '杂粮粥', '饼干'],
      FoodType.tubersStarchesAndProducts => ['土豆', '红薯', '山药', '木薯粉', '红薯粉条'],
      FoodType.dryBeansAndProducts => ['黄豆', '绿豆', '红豆', '豆腐', '豆浆'],
      FoodType.vegetablesAndProducts => [
          '白菜',
          '菠菜',
          '西红柿',
          '黄瓜',
          '胡萝卜',
          '茄子',
          '西兰花'
        ],
      FoodType.mushroomsAndAlgae => ['香菇', '木耳', '海带', '紫菜'],
      FoodType.fruitsAndProducts => ['苹果', '香蕉', '橙子', '西瓜', '葡萄', '草莓'],
      FoodType.nutsAndSeeds => ['花生', '核桃', '杏仁', '瓜子', '芝麻'],
      FoodType.meat => ['猪肉', '牛肉', '羊肉', '鸡肉', '鸭肉'],
      FoodType.dairyAndProducts => ['牛奶', '酸奶', '奶酪', '黄油'],
      FoodType.eggsAndProducts => ['鸡蛋', '鸭蛋', '鹌鹑蛋', '皮蛋'],
      FoodType.snackFoods => ['薯片', '巧克力', '糖果', '爆米花', '饼干'],
      FoodType.beveragesAndColdDrinks => ['果汁', '汽水', '茶', '咖啡', '冰淇淋'],
      FoodType.alcoholicBeverages => ['啤酒', '白酒', '红酒', '黄酒'],
      FoodType.oilsAndFats => ['花生油', '豆油', '菜籽油', '橄榄油', '猪油'],
      FoodType.seasonings => ['盐', '酱油', '醋', '糖', '鸡精', '味精'],
      FoodType.other => ['预制菜', '速食粥', '方便米粉', '方便面'],
    };
  }
}
