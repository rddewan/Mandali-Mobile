part of home;

class AddBibleReaderWidget extends ConsumerStatefulWidget {
  final bool isUpdate;
  const AddBibleReaderWidget({super.key, this.isUpdate = false});

  @override
  ConsumerState<AddBibleReaderWidget> createState() =>
      _AddBibleReaderWidgetState();
}

class _AddBibleReaderWidgetState extends ConsumerState<AddBibleReaderWidget> {
  final _bottomSheetFormKey = GlobalKey<FormState>();
  late TextEditingController _bibleReaderController;

  @override
  void initState() {
    _bibleReaderController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _bibleReaderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: Form(
                key: _bottomSheetFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kMedium,
                    vertical: kXXLarge,
                  ),
                  child: Column(
                    children: [
                      Text(
                        context.localizations('home.addBibleReader'),
                        style: context.textTheme.headlineSmall,
                      ),
                      const SizedBox(height: kMedium),
                      CustomTextFormField(
                        labelText: context.localizations('home.bibleReaders'),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.done,
                        controller: _bibleReaderController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context
                                .localizations('home.inputBibleReader');
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: kMedium),
                      FilledButton.icon(
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kXXLarge,
                            vertical: 0,
                          ),
                        ),
                        onPressed: () {
                          final value = _bibleReaderController.text;
                          _setBibleReader(value.trimRight());
                        },
                        icon: const Icon(Icons.add),
                        label: Text(context.localizations('home.add')),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Text(context.localizations('home.add')),
    );
  }

  void _setBibleReader(String bibleReader) {
    final isValid = _bottomSheetFormKey.currentState?.validate() ?? false;
    final controller = ref.read(homeControllerProvider.notifier);

    if (isValid) {
      // check is update
      if (widget.isUpdate) {
        controller.setUpdateBibleReader(bibleReader);
      } else {
        controller.setBibleReader(bibleReader);
      }

      _bibleReaderController.clear();
      Navigator.of(context).pop();
    }
  }
}
