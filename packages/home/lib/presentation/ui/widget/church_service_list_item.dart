part of home;

class ChurchServiceListItem extends ConsumerWidget {
  final ChurchService churchService;
  const ChurchServiceListItem({super.key, required this.churchService});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId =
        ref.watch(homeControllerProvider.select((value) => value.user?.id));

    final canDelete = userId == churchService.createdBy;
    final canEdit = userId == churchService.createdBy;

    return GestureDetector(
      onTap: () {
        if (!canEdit) {
          return;
        }
        context.push('/editChurchService/${churchService.id}');
      },
      child: Dismissible(
        key: ValueKey(churchService.id),
        direction: DismissDirection.endToStart,
        dismissThresholds: const {DismissDirection.endToStart: 0.6},
        background: ColoredBox(
          color: Colors.red.shade400,
          child: const Padding(
            padding: EdgeInsets.all(kMedium),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
        confirmDismiss: (direction) => canDelete
            ? _confirmDismiss(
                churchService.id,
                context,
                ref,
              )
            : Future.value(false),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSmall),
          child: Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            shadowColor: context.themeColor.primaryColorLight,
            child: Padding(
              padding: const EdgeInsets.all(kSmall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Icon(
                        churchService.serviceType?.icon,
                        color: context.themeColor.iconTheme.color,
                      ),
                    ],
                  ),
                  const SizedBox(height: kSmall),
                  Row(
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedCalendar01,
                        color: context.themeColor.iconTheme.color,
                      ),
                      const SizedBox(width: kSmall),
                      Text(
                        '${churchService.date}',
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: kSmall),
                  Row(
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedChair01,
                        color: context.themeColor.iconTheme.color,
                      ),
                      const SizedBox(width: kSmall),
                      Text(
                        '${churchService.chairPerson}',
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: kSmall),
                  Row(
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedMentor,
                        color: context.themeColor.iconTheme.color,
                      ),
                      const SizedBox(width: kSmall),
                      Text(
                        '${churchService.preacher}',
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: kSmall),
                  Row(
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedBookOpen01,
                        color: context.themeColor.iconTheme.color,
                      ),
                      const SizedBox(width: kSmall),
                      Flexible(
                        child: Text(
                          _formatBibleReaders(
                            churchService.bibleReaders,
                          ),
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kSmall),
                  if (churchService.offering != null) ...[
                    Row(
                      children: [
                        Icon(
                          HugeIcons.strokeRoundedWalletAdd01,
                          color: context.themeColor.iconTheme.color,
                        ),
                        const SizedBox(width: kSmall),
                        Text(
                          '${churchService.offering}',
                          style: context.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: kSmall),
                  if (churchService.worship != null) ...[
                    Row(
                      children: [
                        Icon(
                          HugeIcons.strokeRoundedMusicNote01,
                          color: context.themeColor.iconTheme.color,
                        ),
                        const SizedBox(width: kSmall),
                        Text(
                          '${churchService.worship}',
                          style: context.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _confirmDismiss(
    int? id,
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (id == null) return false;
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning_outlined,
                color: Colors.redAccent,
              ),
              const SizedBox(width: kSmall),
              Text(context.localizations('home.deleteChurchServiceTitle')),
            ],
          ),
          content:
              Text(context.localizations('home.deleteChurchServiceSubTitle')),
          actions: [
            TextButton(
              onPressed: () async {
                // await fro the delete result
                final service = ref.read(homeControllerProvider.notifier);
                final result = await service.deleteChurchService(id.toString());

                // pop the dialog
                if (!context.mounted) return;
                Navigator.of(context).pop(result);
              },
              child: Text(context.localizations('home.btnDelete')),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(context.localizations('home.btnCancel')),
            ),
          ],
        );
      },
    );
  }

  String _formatBibleReaders(List<String> bibleReaders) {
    if (bibleReaders.isEmpty) {
      return '';
    }

    if (bibleReaders.length == 1) {
      return bibleReaders.first;
    }

    if (bibleReaders.length == 2) {
      return bibleReaders.join(' and ');
    }

    return bibleReaders.join(', ');
  }
}
