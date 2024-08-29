part of common;

extension TextThemeContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
