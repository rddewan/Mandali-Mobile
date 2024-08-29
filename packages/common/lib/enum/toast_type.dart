part of common;

enum ToastType {
  regular,
  success,
  error;

  Color get bgColor {
    switch (this) {
      case ToastType.regular:
        return Colors.grey.withOpacity(0.9);
      case ToastType.success:
        return Colors.green.withOpacity(0.9);
      case ToastType.error:
        return Colors.red.withOpacity(0.9);
    }
  }

  IconData get icon {
    switch (this) {
      case ToastType.regular:
        return Icons.info_outline_rounded;
      case ToastType.success:
        return Icons.check_circle_outline;
      case ToastType.error:
        return Icons.highlight_off;
    }
  }
}
