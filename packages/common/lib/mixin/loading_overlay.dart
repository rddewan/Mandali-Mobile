part of common;

mixin LoadingOverlay {
  OverlayEntry showLoadingOverlay(
    BuildContext context,
    OverlayEntry? overlayEntry,
  ) {
    overlayEntry = OverlayEntry(
      builder: (context) {
        return RepaintBoundary(
          child: AbsorbPointer(
            child: Center(
              child: LoadingAnimationWidget.prograssiveDots(
                color: Theme.of(context).primaryColor,
                size: 60,
              ),
            ),
          ),
        );
      },
    );

    final overlay = Overlay.of(context);
    overlay.insert(overlayEntry);

    return overlayEntry;
  }
}
