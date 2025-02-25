import "package:flutter/material.dart";
import "package:foods_assistant/gen/fonts.gen.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff066d30),
      surfaceTint: Color(0xff066d30),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5eb670),
      onPrimaryContainer: Color(0xff00441b),
      secondary: Color(0xff456649),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc4e9c5),
      onSecondaryContainer: Color(0xff496a4d),
      tertiary: Color(0xff006590),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff42adea),
      onTertiaryContainer: Color(0xff003e5b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff6fbf2),
      onSurface: Color(0xff181d18),
      onSurfaceVariant: Color(0xff3f493f),
      outline: Color(0xff6f7a6e),
      outlineVariant: Color(0xffbfcabc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff81da90),
      primaryFixed: Color(0xff9cf7aa),
      onPrimaryFixed: Color(0xff00210a),
      primaryFixedDim: Color(0xff81da90),
      onPrimaryFixedVariant: Color(0xff005322),
      secondaryFixed: Color(0xffc7ecc7),
      onSecondaryFixed: Color(0xff02210a),
      secondaryFixedDim: Color(0xffabd0ac),
      onSecondaryFixedVariant: Color(0xff2e4e33),
      tertiaryFixed: Color(0xffc8e6ff),
      onTertiaryFixed: Color(0xff001e2f),
      tertiaryFixedDim: Color(0xff88ceff),
      onTertiaryFixedVariant: Color(0xff004c6e),
      surfaceDim: Color(0xffd7dbd3),
      surfaceBright: Color(0xfff6fbf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f5ec),
      surfaceContainer: Color(0xffebefe7),
      surfaceContainerHigh: Color(0xffe5eae1),
      surfaceContainerHighest: Color(0xffdfe4db),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004019),
      surfaceTint: Color(0xff066d30),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff217d3e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1d3d23),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff547557),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003a55),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff0074a5),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fbf2),
      onSurface: Color(0xff0d120e),
      onSurfaceVariant: Color(0xff2f392f),
      outline: Color(0xff4b554a),
      outlineVariant: Color(0xff657064),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff81da90),
      primaryFixed: Color(0xff217d3e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00632a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff547557),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3c5c40),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff0074a5),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005a82),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc3c8c0),
      surfaceBright: Color(0xfff6fbf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f5ec),
      surfaceContainer: Color(0xffe5eae1),
      surfaceContainerHigh: Color(0xffdaded6),
      surfaceContainerHighest: Color(0xffced3cb),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003413),
      surfaceTint: Color(0xff066d30),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005524),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff13321a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff305035),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002f47),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004e71),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fbf2),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff252f25),
      outlineVariant: Color(0xff424c41),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff81da90),
      primaryFixed: Color(0xff005524),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003c17),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff305035),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1a3920),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004e71),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003650),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb5bab2),
      surfaceBright: Color(0xfff6fbf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeef2e9),
      surfaceContainer: Color(0xffdfe4db),
      surfaceContainerHigh: Color(0xffd1d6cd),
      surfaceContainerHighest: Color(0xffc3c8c0),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff81da90),
      surfaceTint: Color(0xff81da90),
      onPrimary: Color(0xff003915),
      primaryContainer: Color(0xff5eb670),
      onPrimaryContainer: Color(0xff00441b),
      secondary: Color(0xffabd0ac),
      onSecondary: Color(0xff17371e),
      secondaryContainer: Color(0xff2e4e33),
      onSecondaryContainer: Color(0xff9abe9c),
      tertiary: Color(0xff88ceff),
      onTertiary: Color(0xff00344d),
      tertiaryContainer: Color(0xff42adea),
      onTertiaryContainer: Color(0xff003e5b),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101510),
      onSurface: Color(0xffdfe4db),
      onSurfaceVariant: Color(0xffbfcabc),
      outline: Color(0xff899487),
      outlineVariant: Color(0xff3f493f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4db),
      inversePrimary: Color(0xff066d30),
      primaryFixed: Color(0xff9cf7aa),
      onPrimaryFixed: Color(0xff00210a),
      primaryFixedDim: Color(0xff81da90),
      onPrimaryFixedVariant: Color(0xff005322),
      secondaryFixed: Color(0xffc7ecc7),
      onSecondaryFixed: Color(0xff02210a),
      secondaryFixedDim: Color(0xffabd0ac),
      onSecondaryFixedVariant: Color(0xff2e4e33),
      tertiaryFixed: Color(0xffc8e6ff),
      onTertiaryFixed: Color(0xff001e2f),
      tertiaryFixedDim: Color(0xff88ceff),
      onTertiaryFixedVariant: Color(0xff004c6e),
      surfaceDim: Color(0xff101510),
      surfaceBright: Color(0xff353b35),
      surfaceContainerLowest: Color(0xff0b0f0b),
      surfaceContainerLow: Color(0xff181d18),
      surfaceContainer: Color(0xff1c211c),
      surfaceContainerHigh: Color(0xff262b26),
      surfaceContainerHighest: Color(0xff313630),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff96f0a4),
      surfaceTint: Color(0xff81da90),
      onPrimary: Color(0xff002d0f),
      primaryContainer: Color(0xff5eb670),
      onPrimaryContainer: Color(0xff001e08),
      secondary: Color(0xffc1e6c1),
      onSecondary: Color(0xff0c2c14),
      secondaryContainer: Color(0xff779979),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffbbe1ff),
      onTertiary: Color(0xff00293d),
      tertiaryContainer: Color(0xff42adea),
      onTertiaryContainer: Color(0xff001b2a),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101510),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4dfd1),
      outline: Color(0xffaab5a8),
      outlineVariant: Color(0xff889387),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4db),
      inversePrimary: Color(0xff005423),
      primaryFixed: Color(0xff9cf7aa),
      onPrimaryFixed: Color(0xff001505),
      primaryFixedDim: Color(0xff81da90),
      onPrimaryFixedVariant: Color(0xff004019),
      secondaryFixed: Color(0xffc7ecc7),
      onSecondaryFixed: Color(0xff001505),
      secondaryFixedDim: Color(0xffabd0ac),
      onSecondaryFixedVariant: Color(0xff1d3d23),
      tertiaryFixed: Color(0xffc8e6ff),
      onTertiaryFixed: Color(0xff00131f),
      tertiaryFixedDim: Color(0xff88ceff),
      onTertiaryFixedVariant: Color(0xff003a55),
      surfaceDim: Color(0xff101510),
      surfaceBright: Color(0xff414640),
      surfaceContainerLowest: Color(0xff050805),
      surfaceContainerLow: Color(0xff1a1f1a),
      surfaceContainer: Color(0xff242924),
      surfaceContainerHigh: Color(0xff2f342e),
      surfaceContainerHighest: Color(0xff3a3f39),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc1ffc6),
      surfaceTint: Color(0xff81da90),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff7dd68c),
      onPrimaryContainer: Color(0xff000f03),
      secondary: Color(0xffd4fad4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffa7cca9),
      onSecondaryContainer: Color(0xff000f03),
      tertiary: Color(0xffe4f2ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff7dcbff),
      onTertiaryContainer: Color(0xff000d17),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff101510),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f3e5),
      outlineVariant: Color(0xffbbc6b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe4db),
      inversePrimary: Color(0xff005423),
      primaryFixed: Color(0xff9cf7aa),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff81da90),
      onPrimaryFixedVariant: Color(0xff001505),
      secondaryFixed: Color(0xffc7ecc7),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffabd0ac),
      onSecondaryFixedVariant: Color(0xff001505),
      tertiaryFixed: Color(0xffc8e6ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff88ceff),
      onTertiaryFixedVariant: Color(0xff00131f),
      surfaceDim: Color(0xff101510),
      surfaceBright: Color(0xff4c514b),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1c211c),
      surfaceContainer: Color(0xff2d322c),
      surfaceContainerHigh: Color(0xff383d37),
      surfaceContainerHighest: Color(0xff434842),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        fontFamily: FontFamily.aBeeZee,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
        cardTheme: CardThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.outline, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.outline, width: 2),
            borderRadius: BorderRadius.circular(16)
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.surfaceContainer, width: 1),
              borderRadius: BorderRadius.circular(16)
          ),
          focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.primaryContainer, width:3),
              borderRadius: BorderRadius.circular(16)
          ),
         errorBorder: OutlineInputBorder(
             borderSide: BorderSide(color: colorScheme.errorContainer, width:3),
             borderRadius: BorderRadius.circular(16)
         ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.errorContainer, width:3),
              borderRadius: BorderRadius.circular(16)
          ),
        ),
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
