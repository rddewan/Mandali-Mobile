part of setting;

class LanguagePickerScreen extends ConsumerStatefulWidget {
  const LanguagePickerScreen({super.key});

  @override
  ConsumerState<LanguagePickerScreen> createState() =>
      _LanguagePickerScreenState();
}

class _LanguagePickerScreenState extends ConsumerState<LanguagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    final language = ref.watch(
      settingControllerProvider.select((value) => value.language),
    );

    return AppScaffoldScrollable(
      title: Text(context.localizations('setting.language')),
      widget: Column(
        children: [
          for (var i in AppLocales.available) ...[
            ListTile(
              title: Text(i.englishName),
              leading: Text(i.flagChar),
              trailing: Checkbox(
                value: i.key == language ? true : false,
                onChanged: null,
              ),
              onTap: () {
                ref
                    .read(settingControllerProvider.notifier)
                    .writeLanguage(i.key);
              },
            ),
          ],
        ],
      ),
    );
  }
}
