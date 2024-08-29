part of common;

class MainAppDrawer extends ConsumerWidget {
  const MainAppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Drawer(
        width: MediaQuery.sizeOf(context).width / 1.4,
        shape: const RoundedRectangleBorder(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 150,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    context.localizations('appName'),
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),

            // profile menu
            Consumer(
              builder: (context, ref, child) {
                return ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: Text(context.localizations('drawer.myProfile')),
                  onTap: () {
                    context.push('/account/setting/customerProfile');
                  },
                );
              },
            ),

            // about us menu
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(context.localizations('drawer.aboutUs')),
              onTap: () {
                context.push('/aboutUs');
              },
            ),

            // Q & A menu
            ListTile(
              leading: const Icon(Icons.question_answer_outlined),
              title: Text(context.localizations('drawer.q&a')),
              onTap: () {
                context.push('/faq');
              },
            ),

            // privacy policy menu
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: Text(context.localizations('drawer.privacyPolicy')),
              onTap: () {
                context.push('/privacyPolicy');
              },
            ),

            // contact us
            ListTile(
              leading: const Icon(Icons.contact_support_outlined),
              title: Text(context.localizations('drawer.contactUs')),
              onTap: () {
                context.push('/contactUs');
              },
            ),

            // sign-out menu
            Consumer(
              builder: (context, ref, child) {
                return Column(
                  children: [
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.logout_outlined),
                      title: Text(context.localizations('drawer.signOut')),
                      onTap: () {},
                    ),
                  ],
                );
              },
            ),

            const Divider(),
          ],
        ),
      ),
    );
  }
}
