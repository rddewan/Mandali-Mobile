part of member;

class MemberList extends ConsumerStatefulWidget {
  const MemberList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MemberListState();
}

class _MemberListState extends ConsumerState<MemberList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setScrollController();
    });
  }

  @override
  void dispose() {
    debugPrint('ScrollController 6');
    _scrollController.dispose();
    super.dispose();
  }

  void _setScrollController() {
    // Check if the widget is still mounted
    if (!mounted) return;
    // scroll controller - used to show show and hide bottom navigation bar
    ref.read(scrollControllerProvider.notifier).state = _scrollController;
  }

  @override
  Widget build(BuildContext context) {
    final value =
        ref.watch(memberControllerProvider.select((value) => value.members));
    return AsyncValueWidget(
      value: value,
      data: (users) {
        return RefreshIndicator.adaptive(
          onRefresh: () => _onRefresh(ref),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return MemberListItem(user: user);
            },
          ),
        );
      },
    );
  }

  Future<void> _onRefresh(WidgetRef ref) async {
    ref.read(memberControllerProvider.notifier).refresh();
  }
}
