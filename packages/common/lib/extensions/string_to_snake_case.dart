part of common;

extension StringToSnakeCase on String {
  String toSnakeCase() {
    return split(' ').join('_').toLowerCase();
  }
}
