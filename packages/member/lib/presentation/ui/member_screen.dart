part of member;

class MemberScreen extends ConsumerStatefulWidget {
  const MemberScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MemberScreenState();
}

class _MemberScreenState extends ConsumerState<MemberScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(memberControllerProvider.notifier).getMembers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MainAppScaffoldSliver(
      slivers: [
        SliverFillRemaining(
          child: MemberList(),
        ),
      ],
    );
  }
}
