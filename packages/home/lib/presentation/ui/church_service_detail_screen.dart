part of home;

class ChurchServiceDetailScreen extends ConsumerStatefulWidget {
  final int id;
  const ChurchServiceDetailScreen({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChurchServiceDetailScreenState();
}

class _ChurchServiceDetailScreenState
    extends ConsumerState<ChurchServiceDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final id = widget.id.toString();
      ref.read(homeControllerProvider.notifier).getChurchService(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    _listener();

    return const AppScaffoldScrollable(
      widget: ChurchServiceDetailItem(),
    );
  }

  void _listener() {
    ref.listen(homeControllerProvider.select((value) => value.statusCode),
        (_, next) {
      // 498 = refresh token expired
      if (next != null && next == refreshTokenExpired) {
        context.go('/login');
      }
    });

    ref.listen(homeControllerProvider.select((value) => value.isFetchingDetail),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });
  }
}
