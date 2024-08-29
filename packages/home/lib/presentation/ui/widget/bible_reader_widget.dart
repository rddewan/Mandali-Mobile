part of home;

class BibleReaderWidget extends ConsumerWidget {
  const BibleReaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readers =
        ref.watch(homeControllerProvider.select((value) => value.bibleReaders));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(context.localizations('home.bibleReaders')),
            const Spacer(),
            const AddBibleReaderWidget(),
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
                          .removeBibleReader(index);
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
