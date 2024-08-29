part of home;

class ChurchServiceList extends ConsumerStatefulWidget {
  const ChurchServiceList({super.key});

  @override
  ConsumerState<ChurchServiceList> createState() => _ChurchServiceListState();
}

class _ChurchServiceListState extends ConsumerState<ChurchServiceList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setScrollController();
    });
  }

  @override
  void dispose() async {
    _scrollController.removeListener(() async {
      await _scrollListener();
    });
    _scrollController.dispose();
    super.dispose();
  }

  void _setScrollController() {
    // Check if the widget is still mounted
    if (!mounted) return;
    // scroll controller - used to show show and hide bottom navigation bar
    ref.read(scrollControllerProvider.notifier).state = _scrollController;
  }

  Future<void> _scrollListener() async {
    // Check if the widget is still mounted
    if (!mounted) return;

    final maxScrollExtent = _scrollController.position.maxScrollExtent;

    if (_scrollController.position.pixels >= maxScrollExtent) {
      final currentPage = ref.read(homeControllerProvider).currentPage;
      final totalPage = ref.read(homeControllerProvider).totalPage;

      if (currentPage < totalPage) {
        ref.read(homeControllerProvider.notifier).setIsScrolling(true);
        await ref.read(homeControllerProvider.notifier).getChurchServices();
        _scrollController.animateTo(
          _scrollController.offset + 200,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(
      homeControllerProvider.select((value) => value.churchServices),
    );
    final isLoading = ref.watch(
      homeControllerProvider.select((value) => value.isLoading),
    );

    if (data.isEmpty && !isLoading) {
      return const EmptyChurchService();
    }

    return Stack(
      children: [
        RefreshIndicator.adaptive(
          onRefresh: _onRefresh,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final churchService = data[index];

              return ChurchServiceListItem(churchService: churchService);
            },
          ),
        ),
        const ChurchServiceFetching(),
      ],
    );
  }

  Future<void> _onRefresh() async {
    final service = ref.read(homeControllerProvider.notifier);
    await service.onRefresh();
    service.getChurchServices();
  }
}
