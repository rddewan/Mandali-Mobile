part of common;

mixin ErrorDialogMixin {
  Future<void> showErrorDialog({
    required BuildContext context,
    required String title,
    required String msg,
    required String btnYesText,
    required VoidCallback onOkTap,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSmall),
        ),
        content: Container(
          padding: const EdgeInsets.only(
            top: kXLarge,
            bottom: kMedium,
            left: kMedium,
            right: kMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                  ),
                  const SizedBox(width: kSmall),
                  Text(
                    title,
                    style: context.textTheme.headlineMedium,
                  ),
                ],
              ),
              const SizedBox(height: kMedium),
              Text(
                msg,
                style: context.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: kLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    key: btnNoKey,
                    onPressed: onOkTap,
                    icon: const Icon(Icons.close),
                    label: Text(context.localizations('ok')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
