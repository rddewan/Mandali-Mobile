part of '../../../../../dashboard.dart';

class CartBadgeWidget extends ConsumerWidget {
  final Widget? child;
  const CartBadgeWidget({super.key, this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const int badgeCount = 0;

    return Badge(
      largeSize: Platform.isIOS ? 20 : null,
      isLabelVisible: badgeCount > 0 ? true : false,
      label:
          badgeCount < 1 ? const SizedBox.shrink() : const Text('$badgeCount'),
      child: child,
    );
  }
}
