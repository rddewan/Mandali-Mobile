part of home;

class CreateChurchServiceButton extends ConsumerWidget {
  const CreateChurchServiceButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user =
        ref.watch(homeControllerProvider.select((value) => value.user));
    // user is empty
    if (user == null) {
      return const SizedBox.shrink();
    }
    final roles = user.role?.map((e) => e.name).toList() ?? [];

    // user has permission to create churches service
    if (roles.canCreateChurchService) {
      return FloatingActionButton.extended(
        onPressed: () {
          context.push('/createChurchService');
        },
        icon: const Icon(Icons.add),
        label: Text(context.localizations('home.create')),
      );
    }

    return const SizedBox.shrink();
  }
}
