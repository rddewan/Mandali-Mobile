part of church;

class ChurchScreen extends ConsumerStatefulWidget {
  const ChurchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChurchScreenState();
}

class _ChurchScreenState extends ConsumerState<ChurchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(churchControllerProvider.notifier).findAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      widget: widget,
    );
  }
}
