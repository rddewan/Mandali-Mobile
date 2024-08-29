part of home;

class ChurchServiceDetailItem extends ConsumerWidget {
  const ChurchServiceDetailItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final churchService = ref
        .watch(homeControllerProvider.select((value) => value.churchService));
    final userId =
        ref.watch(homeControllerProvider.select((value) => value.user?.id));
    final isLoading = ref.watch(
      homeControllerProvider.select((value) => value.isFetchingDetail),
    );

    final canEdit = userId == churchService?.createdBy;

    if (isLoading) {
      return const SizedBox();
    }

    return GestureDetector(
      onTap: () {
        if (!canEdit) {
          return;
        }
        context.push('/editChurchService/${churchService?.id}');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSmall),
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shadowColor: context.themeColor.primaryColorLight,
          child: Padding(
            padding: const EdgeInsets.all(kMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Icon(
                      churchService?.serviceType?.icon,
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
                      churchService?.date ?? '',
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
                      churchService?.chairPerson ?? '',
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
                      churchService?.preacher ?? '',
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
                          churchService?.bibleReaders ?? [],
                        ),
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kSmall),
                if (churchService?.offering != null) ...[
                  Row(
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedWalletAdd01,
                        color: context.themeColor.iconTheme.color,
                      ),
                      const SizedBox(width: kSmall),
                      Text(
                        churchService?.offering ?? '',
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: kSmall),
                if (churchService?.worship != null) ...[
                  Row(
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedMusicNote01,
                        color: context.themeColor.iconTheme.color,
                      ),
                      const SizedBox(width: kSmall),
                      Text(
                        '${churchService?.worship}',
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
