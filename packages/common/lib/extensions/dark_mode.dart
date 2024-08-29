part of common;

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
