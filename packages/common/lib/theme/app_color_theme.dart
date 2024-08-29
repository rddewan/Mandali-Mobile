import 'package:flutter/material.dart';

final class AppColorTheme extends ThemeExtension<AppColorTheme> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color errorColor;
  final Color neutralColor;

  AppColorTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.errorColor,
    required this.neutralColor,
  });

  @override

  /// This method facilitates the creation of a new instance of your custom theme extension with potentially modified properties.
  /// It takes optional arguments for the colors,
  /// allowing you to create variations of theme based on needs easily.
  ThemeExtension<AppColorTheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? errorColor,
    Color? neutralColor,
  }) {
    return AppColorTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      errorColor: errorColor ?? this.errorColor,
      neutralColor: neutralColor ?? this.neutralColor,
    );
  }

  @override

  /// Implements the lerp method for the ThemeExtension class.
  /// This method is used for theme animations.
  /// When switching between themes, it enables smooth transitions between color values.
  /// The lerp method performs linear interpolation between two theme extensions.
  /// It returns a new `ThemeExtension<AppColorTheme>` object that represents
  /// the interpolated value between the two input theme extensions.
  ThemeExtension<AppColorTheme> lerp(
    covariant ThemeExtension<AppColorTheme>? other,
    double t,
  ) {
    if (other is! AppColorTheme) {
      return this;
    }

    return AppColorTheme(
      primaryColor:
          Color.lerp(primaryColor, other.primaryColor, t) ?? primaryColor,
      secondaryColor:
          Color.lerp(secondaryColor, other.secondaryColor, t) ?? primaryColor,
      tertiaryColor:
          Color.lerp(tertiaryColor, other.tertiaryColor, t) ?? primaryColor,
      errorColor: Color.lerp(errorColor, other.errorColor, t) ?? primaryColor,
      neutralColor:
          Color.lerp(neutralColor, other.neutralColor, t) ?? primaryColor,
    );
  }
}
