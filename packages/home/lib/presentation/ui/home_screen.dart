part of '../../home.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeControllerProvider.notifier).getUser();
      ref.read(homeControllerProvider.notifier).getSetting();
      ref.read(homeControllerProvider.notifier).getChurchServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    _listener();

    return const MainAppScaffoldSliver(
      slivers: [
        SliverFillRemaining(
          child: ChurchServiceList(),
        ),
      ],
      floatingActionButton: CreateChurchServiceButton(),
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

    ref.listen(
        homeControllerProvider.select((value) => value.isChurchServiceLoading),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });

    ref.listen(homeControllerProvider.select((value) => value.isDeleting),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });
  }
}
