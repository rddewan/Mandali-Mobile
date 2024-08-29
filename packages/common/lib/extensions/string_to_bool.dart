part of common;

extension StringToBool on String {
  bool toBool() {
    return this == 'true' ? true : false;
  }
}
