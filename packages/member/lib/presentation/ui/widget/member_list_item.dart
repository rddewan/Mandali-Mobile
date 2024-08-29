part of member;

class MemberListItem extends ConsumerWidget {
  final MemberModel user;
  const MemberListItem({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = user.photo;
    return GestureDetector(
      onTap: () {
        context.push('/member/memberDetail/${user.id}');
      },
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: kMedium, vertical: kXSmall),
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shadowColor: context.themeColor.primaryColorLight,
          child: Padding(
            padding: const EdgeInsets.all(kMedium),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: context.themeColor.disabledColor,
                      radius: 24,
                      backgroundImage: url != null ? NetworkImage(url) : null,
                      child: url == null
                          ? const Icon(
                              Icons.person_outline,
                              size: 24,
                            )
                          : null,
                    ),
                    const SizedBox(width: kMedium),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: context.textTheme.titleMedium,
                        ),
                        Wrap(
                          spacing: kXSmall,
                          runSpacing: -kMedium,
                          children: _roles(user.roles),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _roles(List<String> roles) {
    return roles
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
        .toList();
  }
}
