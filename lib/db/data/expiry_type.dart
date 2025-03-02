// 定义食物分类的枚举类型
import '../../gen/assets.gen.dart';

enum ExpiryType {
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

  ///医疗药品
  medicalProducts,

  /// 其他（包括以上分类不涵盖的食物品种）
  other;
}

extension FoodTypeExt on ExpiryType {
  ///获取类型icon资源
  AssetGenImage getIconAsset() {
    return switch (this) {
      ExpiryType.grainsAndProducts => Assets.images.iconGrains,
      ExpiryType.tubersStarchesAndProducts => Assets.images.iconTubers,
      ExpiryType.dryBeansAndProducts => Assets.images.iconDry,
      ExpiryType.vegetablesAndProducts => Assets.images.iconVegetables,
      ExpiryType.mushroomsAndAlgae => Assets.images.iconMushrooms,
      ExpiryType.fruitsAndProducts => Assets.images.iconFruits,
      ExpiryType.nutsAndSeeds => Assets.images.iconNuts,
      ExpiryType.meat => Assets.images.iconMeat,
      ExpiryType.dairyAndProducts => Assets.images.iconDairy,
      ExpiryType.eggsAndProducts => Assets.images.iconEggs,
      ExpiryType.snackFoods => Assets.images.iconSnackFood,
      ExpiryType.beveragesAndColdDrinks => Assets.images.iconBeverages,
      ExpiryType.alcoholicBeverages => Assets.images.iconAlcoholic,
      ExpiryType.oilsAndFats => Assets.images.iconOilsFats,
      ExpiryType.seasonings => Assets.images.iconSeasonings,
      ExpiryType.medicalProducts => Assets.images.iconDoctor,
      ExpiryType.other => Assets.images.iconOther,
    };
  }

  ///类别枚举名称
  String getTypeName() {
    return switch (this) {
      ExpiryType.grainsAndProducts => '谷物类',
      ExpiryType.tubersStarchesAndProducts => '淀粉及其制品',
      ExpiryType.dryBeansAndProducts => '豆类及其制品',
      ExpiryType.vegetablesAndProducts => '蔬菜及其制品',
      ExpiryType.mushroomsAndAlgae => '菌藻类',
      ExpiryType.fruitsAndProducts => '水果类',
      ExpiryType.nutsAndSeeds => '坚果类',
      ExpiryType.meat => '肉类',
      ExpiryType.dairyAndProducts => '乳制品',
      ExpiryType.eggsAndProducts => '蛋类及其制品',
      ExpiryType.snackFoods => '休闲食品',
      ExpiryType.beveragesAndColdDrinks => '饮料类',
      ExpiryType.alcoholicBeverages => '酒精饮料',
      ExpiryType.oilsAndFats => '油脂类',
      ExpiryType.seasonings => '调味品',
      ExpiryType.medicalProducts => '医疗药品',
      ExpiryType.other => '其他',
    };
  }

  ///类别种类列举
  List<String> getExample() {
    return switch (this) {
      ExpiryType.grainsAndProducts => ['米饭', '馒头', '面条', '杂粮粥', '饼干'],
      ExpiryType.tubersStarchesAndProducts => ['土豆', '红薯', '山药', '木薯粉', '红薯粉条'],
      ExpiryType.dryBeansAndProducts => ['黄豆', '绿豆', '红豆', '豆腐', '豆浆'],
      ExpiryType.vegetablesAndProducts => [
          '白菜',
          '菠菜',
          '西红柿',
          '黄瓜',
          '胡萝卜',
          '茄子',
          '西兰花'
        ],
      ExpiryType.mushroomsAndAlgae => ['香菇', '木耳', '海带', '紫菜'],
      ExpiryType.fruitsAndProducts => ['苹果', '香蕉', '橙子', '西瓜', '葡萄', '草莓'],
      ExpiryType.nutsAndSeeds => ['花生', '核桃', '杏仁', '瓜子', '芝麻'],
      ExpiryType.meat => ['猪肉', '牛肉', '羊肉', '鸡肉', '鸭肉'],
      ExpiryType.dairyAndProducts => ['牛奶', '酸奶', '奶酪', '黄油'],
      ExpiryType.eggsAndProducts => ['鸡蛋', '鸭蛋', '鹌鹑蛋', '皮蛋'],
      ExpiryType.snackFoods => ['薯片', '巧克力', '糖果', '爆米花', '饼干'],
      ExpiryType.beveragesAndColdDrinks => ['果汁', '汽水', '茶', '咖啡', '冰淇淋'],
      ExpiryType.alcoholicBeverages => ['啤酒', '白酒', '红酒', '黄酒'],
      ExpiryType.oilsAndFats => ['花生油', '豆油', '菜籽油', '橄榄油', '猪油'],
      ExpiryType.seasonings => ['盐', '酱油', '醋', '糖', '鸡精', '味精'],
      ExpiryType.medicalProducts => ['感冒药', '阿莫西林胶囊', '开塞露'],
      ExpiryType.other => ['预制菜', '速食粥', '方便米粉', '方便面'],
    };
  }
}
