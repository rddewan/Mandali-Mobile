part of home;

class EditBibleReaderWidget extends ConsumerWidget {
  const EditBibleReaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readers = ref.watch(
      homeControllerProvider.select((value) => value.updateBibleReaders),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(context.localizations('home.bibleReaders')),
            const Spacer(),
            const AddBibleReaderWidget(isUpdate: true),
          ],
        ),
        const SizedBox(height: kSmall),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Wrap(
                spacing: kSmall,
                children: readers.asMap().entries.map((entry) {
                  int index = entry.key;
                  String reader = entry.value;
                  return ChoiceChip.elevated(
                    label: Text(reader),
                    selected: true,
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: kMedium,
                      vertical: 0,
                    ),
                    padding: const EdgeInsets.all(0),
                    onSelected: (value) {
                      ref
                          .read(homeControllerProvider.notifier)
                          .removeUpdateBibleReader(index);
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
