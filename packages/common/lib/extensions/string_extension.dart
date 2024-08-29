part of common;

extension StringExtension on String {
  String toCapitalized() => "${this[0].toUpperCase()}${substring(1)}";

  String snakeToCaptialized() {
    final parts = split('_');
    final capitalizedCaseString =
        parts.map((word) => word.toCapitalized()).join(' ');
    return capitalizedCaseString;
  }
}
