part of account;

class ImagePickerBottomSheet extends ConsumerWidget {
  const ImagePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(kMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () {
                  _pickImageFromGallery(ref, context);
                },
                icon: const Icon(
                  Icons.image_outlined,
                  size: 40,
                ),
              ),
              const SizedBox(width: kXXXLarge),
              IconButton.filled(
                onPressed: () {
                  _pickImageFromCamera(ref, context);
                },
                icon: const Icon(
                  Icons.camera_enhance_outlined,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _pickImageFromGallery(WidgetRef ref, BuildContext context) async {
    final picker = ref.read(imagePickerProvider);
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (!context.mounted) return;
      context.pop();
      // upload image
      final file = File(image.path);
      ref.read(accountControllerProvider.notifier).uploadProfilePhoto(file);
    }
  }

  void _pickImageFromCamera(WidgetRef ref, BuildContext context) async {
    final picker = ref.read(imagePickerProvider);
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      if (!context.mounted) return;
      context.pop();

      // upload image
      final file = File(image.path);
      ref.read(accountControllerProvider.notifier).uploadProfilePhoto(file);
    }
  }
}
