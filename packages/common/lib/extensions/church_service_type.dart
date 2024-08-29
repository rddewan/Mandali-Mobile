part of common;

extension ServiceTypeIcon on ChurchServiceType {
  IconData get icon {
    switch (this) {
      case ChurchServiceType.cottage:
        return Icons.cottage_outlined;
      case ChurchServiceType.sunday:
        return Icons.church_outlined;
    }
  }
}
