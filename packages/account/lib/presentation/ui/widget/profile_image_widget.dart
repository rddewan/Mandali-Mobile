part of account;

class ProfileImageWidget extends ConsumerWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.center,
          child: Consumer(
            builder: (context, ref, child) {
              final url = ref.watch(
                accountControllerProvider
                    .select((value) => value.profilePhotoUrl),
              );

              return CircleAvatar(
                backgroundColor: context.themeColor.disabledColor,
                radius: 52,
                backgroundImage: url != null ? NetworkImage(url) : null,
                child: url == null
                    ? const Icon(
                        Icons.person_outline,
                        size: 52,
                      )
                    : null,
              );
            },
          ),
        ),
        Positioned(
          bottom: -10,
          right: -20,
          left: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(30, 30),
              backgroundColor: context.themeColor.primaryColor,
              shape: const CircleBorder(),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const ImagePickerBottomSheet();
                },
              );
            },
            child: const Icon(
              Icons.add_a_photo_outlined,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
