import 'package:common/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  AppTheme._();

  static final light = ThemeData.light().copyWith(
    extensions: [
      AppColorTheme(
        primaryColor: hexToColor('#296a47'),
        secondaryColor: hexToColor('#4e6355'),
        tertiaryColor: hexToColor('#3b6471'),
        errorColor: hexToColor('#ba1a1a'),
        neutralColor: hexToColor('#f6fbf4'),
      ),
    ],
  );

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      AppColorTheme(
        primaryColor: hexToColor('#92d5ab'),
        secondaryColor: hexToColor('#b5ccba'),
        tertiaryColor: hexToColor('#a3cddc'),
        errorColor: hexToColor('#ffb4ab'),
        neutralColor: hexToColor('#0f1511'),
      ),
    ],
  );

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
