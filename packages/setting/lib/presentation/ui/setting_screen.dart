part of setting;

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(settingControllerProvider.notifier).readSetting();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainAppScaffold(
      widget: Column(
        children: [
          ListTile(
            title: Text(context.localizations('setting.language')),
            subtitle: Text(context.localizations('setting.selectYourLanguage')),
            trailing: IconButton(
              onPressed: () {
                context.go('/setting/language');
              },
              icon: const Icon(Icons.navigate_next),
            ),
            onTap: () {
              context.go('/setting/language');
            },
          ),
          ListTile(
            title: Text(context.localizations('setting.theme')),
            subtitle: Text(context.localizations('setting.enableDarkMode')),
            trailing: IconButton(
              onPressed: () {
                context.go('/setting/theme');
              },
              icon: const Icon(Icons.navigate_next),
            ),
            onTap: () {
              context.go('/setting/theme');
            },
          ),
        ],
      ),
    );
  }
}
