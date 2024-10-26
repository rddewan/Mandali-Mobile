part of common;

mixin SliverProgressIndicator {
  SliverToBoxAdapter loading(BuildContext context) => SliverToBoxAdapter(
        child: Center(
          child: LoadingAnimationWidget.progressiveDots(
            color: Theme.of(context).primaryColor,
            size: 60,
          ),
        ),
      );
}
