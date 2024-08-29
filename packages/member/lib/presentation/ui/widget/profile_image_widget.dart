part of member;

class ProfileImageWidget extends ConsumerWidget {
  final String? photo;
  const ProfileImageWidget({super.key, this.photo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = photo;
    return Align(
      alignment: Alignment.center,
      child: CircleAvatar(
        backgroundColor: context.themeColor.disabledColor,
        radius: 52,
        backgroundImage: url != null ? NetworkImage(url) : null,
        child: url == null
            ? const Icon(
                Icons.person_outline,
                size: 52,
              )
            : null,
      ),
    );
  }
}
