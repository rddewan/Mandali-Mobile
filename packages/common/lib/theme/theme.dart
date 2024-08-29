import 'package:common/theme/text_theme.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

final materialThemeProvider =
    Provider.family<MaterialTheme, BuildContext>((ref, context) {
  // Use with Google Fonts package to use downloadable fonts
  final textTheme = createTextTheme(
    context,
    "Noto Sans Devanagari",
    "Noto Sans Devanagari",
  );

  return MaterialTheme(textTheme);
});

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff015d25),
      surfaceTint: Color(0xff1b6c32),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff358446),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff486549),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcbedca),
      onSecondaryContainer: Color(0xff335035),
      tertiary: Color(0xff005489),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2979ba),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff7fbf2),
      onSurface: Color(0xff181d18),
      onSurfaceVariant: Color(0xff40493f),
      outline: Color(0xff707a6e),
      outlineVariant: Color(0xffbfc9bc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff88d991),
      primaryFixed: Color(0xffa4f5ab),
      onPrimaryFixed: Color(0xff002108),
      primaryFixedDim: Color(0xff88d991),
      onPrimaryFixedVariant: Color(0xff00531f),
      secondaryFixed: Color(0xffc9ebc8),
      onSecondaryFixed: Color(0xff04210b),
      secondaryFixedDim: Color(0xffaecfad),
      onSecondaryFixedVariant: Color(0xff314d33),
      tertiaryFixed: Color(0xffd0e4ff),
      onTertiaryFixed: Color(0xff001d34),
      tertiaryFixedDim: Color(0xff9bcbff),
      onTertiaryFixedVariant: Color(0xff004a79),
      surfaceDim: Color(0xffd7dbd3),
      surfaceBright: Color(0xfff7fbf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f5ec),
      surfaceContainer: Color(0xffebefe7),
      surfaceContainerHigh: Color(0xffe5e9e1),
      surfaceContainerHighest: Color(0xffe0e4db),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004e1d),
      surfaceTint: Color(0xff1b6c32),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff358446),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2d4930),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5e7c5f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff004673),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2979ba),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7fbf2),
      onSurface: Color(0xff181d18),
      onSurfaceVariant: Color(0xff3c453b),
      outline: Color(0xff586257),
      outlineVariant: Color(0xff737d72),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff88d991),
      primaryFixed: Color(0xff358446),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff176a2f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5e7c5f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff456347),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff2979ba),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00609b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dbd3),
      surfaceBright: Color(0xfff7fbf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f5ec),
      surfaceContainer: Color(0xffebefe7),
      surfaceContainerHigh: Color(0xffe5e9e1),
      surfaceContainerHighest: Color(0xffe0e4db),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00290c),
      surfaceTint: Color(0xff1b6c32),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004e1d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff0b2811),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2d4930),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00243f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004673),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7fbf2),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1d261d),
      outline: Color(0xff3c453b),
      outlineVariant: Color(0xff3c453b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xffaeffb5),
      primaryFixed: Color(0xff004e1d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003511),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2d4930),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff16331b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004673),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff002f50),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dbd3),
      surfaceBright: Color(0xfff7fbf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f5ec),
      surfaceContainer: Color(0xffebefe7),
      surfaceContainerHigh: Color(0xffe5e9e1),
      surfaceContainerHighest: Color(0xffe0e4db),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff88d991),
      surfaceTint: Color(0xff88d991),
      onPrimary: Color(0xff003913),
      primaryContainer: Color(0xff2d7c3f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffaecfad),
      onSecondary: Color(0xff1a361e),
      secondaryContainer: Color(0xff29462c),
      onSecondaryContainer: Color(0xffbbddba),
      tertiary: Color(0xff9bcbff),
      onTertiary: Color(0xff003256),
      tertiaryContainer: Color(0xff1c71b2),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101510),
      onSurface: Color(0xffe0e4db),
      onSurfaceVariant: Color(0xffbfc9bc),
      outline: Color(0xff899387),
      outlineVariant: Color(0xff40493f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4db),
      inversePrimary: Color(0xff1b6c32),
      primaryFixed: Color(0xffa4f5ab),
      onPrimaryFixed: Color(0xff002108),
      primaryFixedDim: Color(0xff88d991),
      onPrimaryFixedVariant: Color(0xff00531f),
      secondaryFixed: Color(0xffc9ebc8),
      onSecondaryFixed: Color(0xff04210b),
      secondaryFixedDim: Color(0xffaecfad),
      onSecondaryFixedVariant: Color(0xff314d33),
      tertiaryFixed: Color(0xffd0e4ff),
      onTertiaryFixed: Color(0xff001d34),
      tertiaryFixedDim: Color(0xff9bcbff),
      onTertiaryFixedVariant: Color(0xff004a79),
      surfaceDim: Color(0xff101510),
      surfaceBright: Color(0xff363a35),
      surfaceContainerLowest: Color(0xff0b0f0b),
      surfaceContainerLow: Color(0xff181d18),
      surfaceContainer: Color(0xff1c211c),
      surfaceContainerHigh: Color(0xff272b26),
      surfaceContainerHighest: Color(0xff313630),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8cdd95),
      surfaceTint: Color(0xff88d991),
      onPrimary: Color(0xff001b06),
      primaryContainer: Color(0xff53a160),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb2d3b1),
      onSecondary: Color(0xff011b06),
      secondaryContainer: Color(0xff799979),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffa3cfff),
      onTertiary: Color(0xff00172c),
      tertiaryContainer: Color(0xff4d95d8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101510),
      onSurface: Color(0xfff8fcf3),
      onSurfaceVariant: Color(0xffc3cec0),
      outline: Color(0xff9ca699),
      outlineVariant: Color(0xff7c867a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4db),
      inversePrimary: Color(0xff005420),
      primaryFixed: Color(0xffa4f5ab),
      onPrimaryFixed: Color(0xff001504),
      primaryFixedDim: Color(0xff88d991),
      onPrimaryFixedVariant: Color(0xff004017),
      secondaryFixed: Color(0xffc9ebc8),
      onSecondaryFixed: Color(0xff001504),
      secondaryFixedDim: Color(0xffaecfad),
      onSecondaryFixedVariant: Color(0xff203c24),
      tertiaryFixed: Color(0xffd0e4ff),
      onTertiaryFixed: Color(0xff001224),
      tertiaryFixedDim: Color(0xff9bcbff),
      onTertiaryFixedVariant: Color(0xff00385f),
      surfaceDim: Color(0xff101510),
      surfaceBright: Color(0xff363a35),
      surfaceContainerLowest: Color(0xff0b0f0b),
      surfaceContainerLow: Color(0xff181d18),
      surfaceContainer: Color(0xff1c211c),
      surfaceContainerHigh: Color(0xff272b26),
      surfaceContainerHighest: Color(0xff313630),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff0ffec),
      surfaceTint: Color(0xff88d991),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8cdd95),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff0ffec),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb2d3b1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffafaff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa3cfff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101510),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff3feef),
      outline: Color(0xffc3cec0),
      outlineVariant: Color(0xffc3cec0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4db),
      inversePrimary: Color(0xff003210),
      primaryFixed: Color(0xffa8faaf),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff8cdd95),
      onPrimaryFixedVariant: Color(0xff001b06),
      secondaryFixed: Color(0xffcef0cc),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb2d3b1),
      onSecondaryFixedVariant: Color(0xff011b06),
      tertiaryFixed: Color(0xffd7e8ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa3cfff),
      onTertiaryFixedVariant: Color(0xff00172c),
      surfaceDim: Color(0xff101510),
      surfaceBright: Color(0xff363a35),
      surfaceContainerLowest: Color(0xff0b0f0b),
      surfaceContainerLow: Color(0xff181d18),
      surfaceContainer: Color(0xff1c211c),
      surfaceContainerHigh: Color(0xff272b26),
      surfaceContainerHighest: Color(0xff313630),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            textStyle: TextStyle(
              inherit: true,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
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
