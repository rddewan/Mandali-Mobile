part of common;

mixin SuccessDialogMixin {
  Future<void> showSuccessDialog({
    required BuildContext context,
    required String title,
    required String msg,
    required String btnOkText,
    required VoidCallback onOkTap,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      useRootNavigator: false,
      context: context,
      barrierDismissible: barrierDismissible,
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
              Text(
                title,
                style: context.textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
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
                    onPressed: onOkTap,
                    icon: const Icon(
                      Icons.check_outlined,
                      color: Colors.green,
                    ),
                    label: Text(btnOkText),
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
