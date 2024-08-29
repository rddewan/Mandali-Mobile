part of '../../../../dashboard.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(accountControllerProvider.notifier).me();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(child: widget.navigationShell),
      bottomNavigationBar: ScrollToHide(
        child: BottomNavigationWidget(
          navigationShell: widget.navigationShell,
        ),
      ),
    );
  }
}
