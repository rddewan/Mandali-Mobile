part of common;

class BaseLoadingIndicator extends ConsumerWidget {
  const BaseLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: LoadingAnimationWidget.prograssiveDots(
        color: context.isDarkMode
            ? context.themeColor.primaryColorLight
            : context.themeColor.primaryColor,
        size: 60,
      ),
    );
  }
}
