part of common;

mixin SliverProgressIndicator {
  SliverToBoxAdapter loading(BuildContext context) => SliverToBoxAdapter(
        child: Center(
          child: LoadingAnimationWidget.prograssiveDots(
            color: Theme.of(context).primaryColor,
            size: 60,
          ),
        ),
      );
}
