/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/icon_alcoholic.png
  AssetGenImage get iconAlcoholic =>
      const AssetGenImage('assets/images/icon_alcoholic.png');

  /// File path: assets/images/icon_beverages.png
  AssetGenImage get iconBeverages =>
      const AssetGenImage('assets/images/icon_beverages.png');

  /// File path: assets/images/icon_dairy.png
  AssetGenImage get iconDairy =>
      const AssetGenImage('assets/images/icon_dairy.png');

  /// File path: assets/images/icon_dry.png
  AssetGenImage get iconDry =>
      const AssetGenImage('assets/images/icon_dry.png');

  /// File path: assets/images/icon_eggs.png
  AssetGenImage get iconEggs =>
      const AssetGenImage('assets/images/icon_eggs.png');

  /// File path: assets/images/icon_empty.png
  AssetGenImage get iconEmpty =>
      const AssetGenImage('assets/images/icon_empty.png');

  /// File path: assets/images/icon_fruits.png
  AssetGenImage get iconFruits =>
      const AssetGenImage('assets/images/icon_fruits.png');

  /// File path: assets/images/icon_grains.png
  AssetGenImage get iconGrains =>
      const AssetGenImage('assets/images/icon_grains.png');

  /// File path: assets/images/icon_meat.png
  AssetGenImage get iconMeat =>
      const AssetGenImage('assets/images/icon_meat.png');

  /// File path: assets/images/icon_mushrooms.png
  AssetGenImage get iconMushrooms =>
      const AssetGenImage('assets/images/icon_mushrooms.png');

  /// File path: assets/images/icon_nuts.png
  AssetGenImage get iconNuts =>
      const AssetGenImage('assets/images/icon_nuts.png');

  /// File path: assets/images/icon_oils_fats.png
  AssetGenImage get iconOilsFats =>
      const AssetGenImage('assets/images/icon_oils_fats.png');

  /// File path: assets/images/icon_other.png
  AssetGenImage get iconOther =>
      const AssetGenImage('assets/images/icon_other.png');

  /// File path: assets/images/icon_seasonings.png
  AssetGenImage get iconSeasonings =>
      const AssetGenImage('assets/images/icon_seasonings.png');

  /// File path: assets/images/icon_snack_food.png
  AssetGenImage get iconSnackFood =>
      const AssetGenImage('assets/images/icon_snack_food.png');

  /// File path: assets/images/icon_tubers.png
  AssetGenImage get iconTubers =>
      const AssetGenImage('assets/images/icon_tubers.png');

  /// File path: assets/images/icon_vegetables.png
  AssetGenImage get iconVegetables =>
      const AssetGenImage('assets/images/icon_vegetables.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        iconAlcoholic,
        iconBeverages,
        iconDairy,
        iconDry,
        iconEggs,
        iconEmpty,
        iconFruits,
        iconGrains,
        iconMeat,
        iconMushrooms,
        iconNuts,
        iconOilsFats,
        iconOther,
        iconSeasonings,
        iconSnackFood,
        iconTubers,
        iconVegetables
      ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
