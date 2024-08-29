part of '../../../../../dashboard.dart';

class ScrollToHide extends ConsumerStatefulWidget {
  final Widget child;

  const ScrollToHide({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScrollToHideState();
}

class _ScrollToHideState extends ConsumerState<ScrollToHide> {
  bool isVisible = true;
  ScrollController? scrollController;

  @override
  void dispose() {
    scrollController?.removeListener(_listener);
    scrollController = null;
    super.dispose();
  }

  void _listener() {
    if (!mounted) return;
    if (scrollController?.hasClients == false) return;

    if (scrollController?.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _hide();
    } else if (scrollController?.position.userScrollDirection ==
        ScrollDirection.forward) {
      _show();
    }
  }

  void _show() {
    if (!mounted) return;

    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void _hide() {
    if (!mounted) return;

    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final newController = ref.watch(scrollControllerProvider);

    if (scrollController != newController) {
      if (scrollController != null) {
        scrollController?.removeListener(_listener);
      }
      scrollController = newController;
      scrollController?.addListener(_listener);
    }

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: isVisible ? 80 + MediaQuery.viewPaddingOf(context).bottom : 0,
      child: Wrap(
        children: [widget.child],
      ),
    );
  }
}
