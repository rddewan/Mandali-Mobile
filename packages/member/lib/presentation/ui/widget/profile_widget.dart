part of member;

class ProfileWidget extends ConsumerWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(memberControllerProvider.select((value) => value.isLoading));

    if (isLoading) {
      return const SizedBox.shrink();
    }

    return Consumer(
      builder: (context, ref, child) {
        // watch user
        final member =
            ref.watch(memberControllerProvider.select((value) => value.member));

        return Padding(
          padding: const EdgeInsets.all(kMedium),
          child: Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            shadowColor: context.themeColor.primaryColorLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kMedium),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kSmall),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Wrap(
                        spacing: kXSmall,
                        runSpacing: -kMedium,
                        children: _guilds(member),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: kMedium),
                      ProfileImageWidget(photo: member?.photo),
                      const SizedBox(height: kMedium),
                      Text(
                        member?.name ?? '',
                        style: context.textTheme.titleLarge,
                      ),
                      const SizedBox(height: kMedium),
                      Text(
                        member?.phoneNumber ?? '',
                        style: context.textTheme.bodyLarge,
                      ),
                      if (member?.roles != null) ...[
                        Wrap(
                          spacing: kXSmall,
                          runSpacing: -kMedium,
                          children: _roles(member),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _roles(MemberModel? user) {
    return user?.roles
            .map(
              (e) => Chip(
                label: Text(e),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: -4,
                ),
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kMedium),
                ),
              ),
            )
            .toList() ??
        [];
  }

  List<Widget> _guilds(MemberModel? user) {
    return user?.guilds
            .map(
              (e) => Chip(
                label: Text(e),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: -4,
                ),
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kMedium),
                ),
              ),
            )
            .toList() ??
        [];
  }
}
