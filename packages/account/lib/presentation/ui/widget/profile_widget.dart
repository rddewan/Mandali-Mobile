part of account;

class ProfileWidget extends ConsumerWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(accountControllerProvider.select((value) => value.isLoading));

    if (isLoading) {
      return const SizedBox.shrink();
    }

    return Consumer(
      builder: (context, ref, child) {
        // watch user
        final user =
            ref.watch(accountControllerProvider.select((value) => value.user));

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
                      IconButton(
                        onPressed: () {
                          _showEditProfile(context);
                        },
                        icon: const Icon(Icons.edit_outlined),
                      ),
                    ],
                  ),
                  const ProfileImageWidget(),
                  const SizedBox(height: kMedium),
                  Text(
                    user?.name ?? '',
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(height: kMedium),
                  Text(
                    user?.phoneNumber ?? '',
                    style: context.textTheme.bodyLarge,
                  ),
                  if (user?.role != null) ...[
                    Wrap(
                      spacing: kXSmall,
                      runSpacing: -kMedium,
                      children: _roles(user),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showEditProfile(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return const EditProfileWidget();
      },
    );
  }

  List<Widget> _roles(UserEntity? user) {
    return user?.role
            ?.map(
              (e) => Chip(
                label: Text(e.name?.name ?? ''),
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
