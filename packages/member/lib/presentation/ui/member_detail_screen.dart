part of member;

class MemberDetailScreen extends ConsumerStatefulWidget {
  final int id;
  const MemberDetailScreen({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MemberDetailScreenState();
}

class _MemberDetailScreenState extends ConsumerState<MemberDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final id = widget.id.toString();
      ref.read(memberControllerProvider.notifier).getMember(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    _listener();

    return const AppScaffoldScrollable(
      widget: ProfileWidget(),
    );
  }

  void _listener() {
    ref.listen(memberControllerProvider.select((value) => value.isLoading),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });
  }
}
