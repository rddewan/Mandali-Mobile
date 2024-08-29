part of common;

extension Translations on BuildContext {
  String localizations(
    String key, {
    Map<String, Object>? namedArgs,
  }) =>
      AppLocalizations.of(this)?.translate(
        key,
        namedArgs: namedArgs,
      ) ??
      'could not translate, context maybe missing';
}
