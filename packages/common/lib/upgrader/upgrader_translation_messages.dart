part of common;

class UpgraderTranslationMessages extends UpgraderMessages {
  final String code;
  UpgraderTranslationMessages({required this.code}) : super(code: code);

  /// Override the message function to provide custom language localization.
  @override
  String message(UpgraderMessage messageKey) {
    if (languageCode == 'np') {
      switch (messageKey) {
        case UpgraderMessage.body:
          return '{{appName}} को नयाँ संस्करण अब उपलब्ध छ। तपाईको हालको संस्करण ({{currentInstalledVersion}}) हो र पछिल्लो संस्करण ({{currentAppStoreVersion}}) हो।';
        case UpgraderMessage.buttonTitleIgnore:
          return 'बेवास्ता गर्नुहोस्';
        case UpgraderMessage.buttonTitleLater:
          return 'पछि';
        case UpgraderMessage.buttonTitleUpdate:
          return 'अहिले अपडेट गर्नुहोस्';
        case UpgraderMessage.prompt:
          return 'अपडेट गर्न चाहनुहुन्छ?';
        case UpgraderMessage.releaseNotes:
          return 'रिलिज नोटहरू';
        case UpgraderMessage.title:
          return 'एप अपडेट गर्ने हो?';
      }
    }
    // Messages that are not provided above can still use the default values.
    return super.message(messageKey) ?? messageKey.toString();
  }
}
