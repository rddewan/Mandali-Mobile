part of common;

// TODO(Richard): seperate function and widget - SRP is broken here

void showBaseToast({
  required String message,
  ToastType toastType = ToastType.regular,
  StyledToastPosition position = StyledToastPosition.center,
  Duration duration = const Duration(seconds: 5),
}) {
  showToastWidget(
    BaseToastWidget(
      message: message,
      toastType: toastType,
    ),
    position: position,
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fadeScale,
    animDuration: const Duration(milliseconds: 500),
    duration: duration,
  );
}

class BaseToastWidget extends StatelessWidget {
  final String message;
  final ToastType toastType;

  const BaseToastWidget({
    super.key,
    required this.message,
    required this.toastType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kXLarge,
        vertical: kSmall,
      ),
      margin: const EdgeInsets.all(kMedium),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSmall),
        ),
        color: toastType.bgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            toastType.icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(height: kSmall),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
