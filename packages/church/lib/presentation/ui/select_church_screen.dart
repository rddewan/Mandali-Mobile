part of church;

class SelectChurchScreen extends ConsumerStatefulWidget {
  const SelectChurchScreen({super.key});

  @override
  ConsumerState<SelectChurchScreen> createState() => _SelectChurchScreenState();
}

class _SelectChurchScreenState extends ConsumerState<SelectChurchScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(churchControllerProvider.notifier).findAll();
    });
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue =
        ref.watch(churchControllerProvider.select((value) => value.churchList));
    return AppScaffold(
      widget: AsyncValueWidget(
        value: asyncValue,
        data: (churchList) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownMenu<ChurchModel>(
                  controller: _controller,
                  width: MediaQuery.of(context).size.width * 0.8,
                  enableFilter: true,
                  enableSearch: true,
                  requestFocusOnTap: true,
                  leadingIcon: const Icon(Icons.search),
                  label: const Text('Your Church...'),
                  onSelected: (value) {
                    ref
                        .read(churchControllerProvider.notifier)
                        .setSelectedChurch(value);
                  },
                  dropdownMenuEntries: churchList.map((e) {
                    return DropdownMenuEntry<ChurchModel>(
                      value: e,
                      label: e.name,
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: IconButton.filled(
        onPressed: () {
          final selectedChurch =
              ref.read(churchControllerProvider.notifier).getSelectedChurch();
          if (selectedChurch != null) {
            _controller.clear();
            context.go('/login/phoneAuth');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 5),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kMedium),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(kMedium),
                  ),
                ),
                content: Text('Please select your church'),
              ),
            );
          }
        },
        icon: const Icon(Icons.navigate_next),
      ),
    );
  }
}
