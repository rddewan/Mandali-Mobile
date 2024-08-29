part of home;

class ChurchServiceFetching extends ConsumerWidget {
  const ChurchServiceFetching({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFetching = ref.watch(
      homeControllerProvider.select((value) => value.isFetching),
    );

    if (isFetching) {
      return const Positioned(
        bottom: kMedium,
        left: 0,
        right: 0,
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
