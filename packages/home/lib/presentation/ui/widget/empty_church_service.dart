part of home;

class EmptyChurchService extends ConsumerWidget {
  const EmptyChurchService({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      homeControllerProvider.select((value) => value.isChurchServiceLoading),
    );
    final isFetching = ref.watch(
      homeControllerProvider.select((value) => value.isFetching),
    );

    if (isLoading || isFetching) {
      return const SizedBox.shrink();
    }

    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.all(kMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.emptyBox.svg(
              width: 120,
              height: 120,
            ),
            const SizedBox(height: kMedium),
            Text(
              context.localizations('home.noChurchServiceFoundTitle'),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: kSmall),
            Text(
              context.localizations('home.noChurchServiceFoundSubTitle'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
