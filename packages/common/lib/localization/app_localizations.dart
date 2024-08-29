part of common;

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;
  late Map<String, String> _localizedString;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Future<void> load() async {
    final jsonString = await rootBundle
        .loadString('packages/common/assets/i18n/${locale.languageCode}.json');
    _localizedString = await compute(_deCodeTranslations, jsonString);
  }

  Map<String, String> _deCodeTranslations(String data) {
    return Map<String, String>.from(jsonDecode(data) as Map);
  }

  String translate(
    String key, {
    Map<String, Object>? namedArgs,
  }) {
    var text = _localizedString[key] ?? 'No translation is found';

    // text placeholder value
    if (namedArgs != null && namedArgs.isNotEmpty) {
      namedArgs.forEach((key, value) {
        text = text.replaceAll('{$key}', '$value');
      });
    }
    return text;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static AppLocalizations get instance => _AppLocalizationsDelegate.instance;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  static late AppLocalizations instance;

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // create new instance on our AppLocalizations
    final localization = AppLocalizations(locale);
    // load the json translation file
    await localization.load();

    instance = localization;

    return instance;
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ne'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
