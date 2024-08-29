part of account;

class DeleteAccountButton extends ConsumerWidget {
  final void Function()? onPressed;
  const DeleteAccountButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      accountControllerProvider.select((value) => value.isLoading),
    );

    if (isLoading) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(kMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: onPressed,
            child: Text(context.localizations('account.deleteMyAccount')),
          ),
        ],
      ),
    );
  }
}
