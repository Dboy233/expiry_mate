import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade package to version 8.1.1.
///
/// Use in [MaterialApp] like this:
///
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
/// ///地址，修改后随时更改此地址
/// https://rydmike.com/flexcolorscheme/themesplayground-latest/?config=H4sIALEUwGcA_8VZW2_iOBR-n1-B-ryqApRC-xZuO2hbbdXQjrQvyCQHYo2xLceBsqP573viJECuoEmZZV5GOZ_P5fOx_dn98aWFvxvJyH6tRMi9hUc0uXls3cx92EDQejlYWpGlBR9SKA1eq9O_tTq3HavTa7V7j13rsde_-aPgbQsqoIJHDge37dt2CiEekZpuwZZySJTjKsHYG_dA_b1aPdG1r3HEDwM1cI8ovdB7CZEj4OFmkTpYKAik4AEkng18S1hooISxG_P5Zy7uazJqxmWox-AKRbRQr8SjYXCt0IyuOXhjJaQndhElWoWQGg0PI-Aa1JxqBmXmuSI8kEQhytFEhwF-Q9yKsCAFLoXWYuP4AHooFPJ5KKl9X4SMGJVD8MmWCnWuahex5YVyTW1GSfCNat8hW3gie1DZ2l2ivKp8XB-TYMC9kWBCBdnCXbGRxNXPwssx4oYBVjFRSqiR4JpQDupc47hRgNIapvgb2-P7XNbHGGOivv-y5-GdPaz03CTpod3Gf2WuXxTdELU_UNMgf8vqdnql-eeDNCllbE3uptOaKA0qeJiOHs76foXVLxN0Nxi0a9w34eUy59dI3sFdkXuf1ESDfqdtWZeFabiMh6PSqT7EabaUew_js95_fTbsUbdrle5ChwBN2LnU_TUKmIPS9NO2pLtJ7-GiKE3oeuhNrfJ9Iw3TZEXcjzuT0oV36rzJwr4f9Ht1_pttSxd5v0b6bwEEETWxXJgK5QB4ORm0YoJoyte2q1F9DkNUPNxmO7IPRlS5ITO66URNlOExjuMTmdMdNCMYh8T9Hitdm0mfJO1wZ10CTunvl4Mr1FI1yk5k6Tm040bK3rB3pn2N7gsMfFE9VzI-h7JTdSbwRRL_8yLPY7e10VYMPhZm8GJpBsXmsrgi1Az3lvNxv1FP-9F83PZKUVOBLQ1eFtytg34lQYyu68pZMIboWpJdE3nMlDJWWDhZ0AvxPFwVQ3NjqO6rBDbh3lkM3luUPouaC1mDUbCiHzM8r6L2PWmqz-qnKf1AXmom95jBZ0YX_OUk_jtRFG9WdWn8DwvZCVfX5f6y4L858BtfnS7UWWAim7VTuQYPYypW7Aazw-t7cYNPDHj0eGJ3rsTqsqzkl60rcj7jHnWz59EV-DwIsJoE8OyGqyVQE7ec9OJXTrZ0TYwiIOpIW-5k7teir15ZJuwTWQK79EXnOHLhQYDyJ_4_i3wslqmT8retSEo5vthV5fJKKPt9HEghQ_kcLZzc3HTygAmDrUkQrakxjonZwkd0_A7Sz0CU6-M5GTLmuAqA587KGFBsm_g7ysc_mVgSViIiA1hvoqc-L1aaVVovQIKdJDncWw7vY5kk6AblLJJsS5mWYOVtI7GRgmPEIIU85CFj2FL3QEI7b36nsPtHGBHQ7x-IYzQSVwr3ka-QKLq2lTG-R_M2p1GtOQo4jsKOrax9R-QTrIm7j8ue8eduvnSEJEemjVtI5gZbztWOatef--Fmac5Yh_6bF0k6Yjt5baxtVANcbCJkWZsyQ0emSbVYrxnEMx5Ula2FYJrKSkPwTLCE486dJVULSV0zh6jFHGqq6BRsRoMl1m4qTEMUjAxcnKe5yfP0kDslCI8082xZ_DxFAW3GxC2bzQztf8G-dFbQ9NxNHnIrzEQDqiHWLfg8THpxkBMu4z9hFAalN9TimOMTdEr7NsK6hJ08QH_5-R-LRjpnNRkAAA==
abstract final class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.blumineBlue,
    transparentStatusBar: false,
    tooltipsMatchBackground: true,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
      adaptiveInputDecoratorRadius: FlexAdaptive.all(),
      toggleButtonsRadius: 16.0,
      segmentedButtonRadius: 16.0,
      sliderValueTinted: true,
      sliderTrackHeight: 10,
      inputDecoratorContentPadding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      inputDecoratorBackgroundAlpha: 7,
      inputDecoratorBorderSchemeColor: SchemeColor.primary,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 16.0,
      inputDecoratorRadiusAdaptive: 16.0,
      inputDecoratorUnfocusedBorderIsColored: true,
      inputDecoratorBorderWidth: 1.5,
      inputDecoratorFocusedBorderWidth: 3.0,
      inputDecoratorPrefixIconSchemeColor: SchemeColor.onPrimaryFixedVariant,
      inputDecoratorSuffixIconSchemeColor: SchemeColor.primary,
      fabUseShape: true,
      fabAlwaysCircular: true,
      chipBlendColors: true,
      cardRadius: 16.0,
      popupMenuRadius: 12.0,
      popupMenuElevation: 2.0,
      alignedDropdown: true,
      tooltipRadius: 16,
      snackBarRadius: 16,
      appBarCenterTitle: true,
      bottomSheetRadius: 16.0,
      bottomSheetClipBehavior: Clip.antiAliasWithSaveLayer,
      menuRadius: 16.0,
      menuBarRadius: 16.0,
      menuBarShadowColor: Color(0x00000000),
      menuIndicatorBackgroundSchemeColor: SchemeColor.primaryContainer,
      menuIndicatorForegroundSchemeColor: SchemeColor.primary,
      menuIndicatorRadius: 16.0,
      searchBarRadius: 16.0,
      searchViewRadius: 16.0,
      searchUseGlobalShape: true,
      navigationBarIndicatorSchemeColor: SchemeColor.primary,
      navigationBarIndicatorRadius: 17.0,
      navigationRailUseIndicator: true,
      navigationRailIndicatorSchemeColor: SchemeColor.primary,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.blumineBlue,
    transparentStatusBar: false,
    tooltipsMatchBackground: true,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      adaptiveInputDecoratorRadius: FlexAdaptive.all(),
      toggleButtonsRadius: 16.0,
      segmentedButtonRadius: 16.0,
      sliderValueTinted: true,
      sliderTrackHeight: 10,
      inputDecoratorSchemeColor: SchemeColor.primary,
      inputDecoratorContentPadding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      inputDecoratorBackgroundAlpha: 40,
      inputDecoratorBorderSchemeColor: SchemeColor.primary,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 16.0,
      inputDecoratorRadiusAdaptive: 16.0,
      inputDecoratorUnfocusedBorderIsColored: true,
      inputDecoratorBorderWidth: 1.5,
      inputDecoratorFocusedBorderWidth: 3.0,
      inputDecoratorPrefixIconSchemeColor: SchemeColor.primaryFixed,
      inputDecoratorSuffixIconSchemeColor: SchemeColor.primary,
      fabUseShape: true,
      fabAlwaysCircular: true,
      chipBlendColors: true,
      cardRadius: 16.0,
      popupMenuRadius: 12.0,
      popupMenuElevation: 2.0,
      alignedDropdown: true,
      tooltipRadius: 16,
      snackBarRadius: 16,
      appBarCenterTitle: true,
      bottomSheetRadius: 16.0,
      bottomSheetClipBehavior: Clip.antiAliasWithSaveLayer,
      menuRadius: 16.0,
      menuBarRadius: 16.0,
      menuBarShadowColor: Color(0x00000000),
      menuIndicatorBackgroundSchemeColor: SchemeColor.primaryContainer,
      menuIndicatorForegroundSchemeColor: SchemeColor.primary,
      menuIndicatorRadius: 16.0,
      searchBarRadius: 16.0,
      searchViewRadius: 16.0,
      searchUseGlobalShape: true,
      navigationBarIndicatorSchemeColor: SchemeColor.primary,
      navigationBarIndicatorRadius: 17.0,
      navigationRailUseIndicator: true,
      navigationRailIndicatorSchemeColor: SchemeColor.primary,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
