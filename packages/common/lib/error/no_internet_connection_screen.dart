part of common;

class NoInternetConnectionScreen extends ConsumerStatefulWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  ConsumerState<NoInternetConnectionScreen> createState() =>
      _NoInternetConnectionScreenState();
}

class _NoInternetConnectionScreenState
    extends ConsumerState<NoInternetConnectionScreen> {
  @override
  void initState() {
    super.initState();
    _networkConnectionObserver();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("No Internet"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Please check your internet connection'),
            ElevatedButton.icon(
              onPressed: () {
                _isNetworkConnected();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }

  void _isNetworkConnected() async {
    // final isConnected =
    //     await ref.read(internetConnectionObserverProvider).isNetworkConnected();
    // if (isConnected) {
    //   if (!mounted) return;
    //   context.pop();
    // }
  }

  void _networkConnectionObserver() {
    // final connectionStream =
    //     ref.read(internetConnectionObserverProvider).hasConnectionStream.stream;
    // connectionStream.listen((isConnected) {
    //   if (isConnected) {
    //     if (!mounted) return;
    //     context.pop();
    //   }
    // });
  }
}
