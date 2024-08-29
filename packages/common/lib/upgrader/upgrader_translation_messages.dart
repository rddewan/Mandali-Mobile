part of common;

class UpgraderTranslationMessages extends UpgraderMessages {
  /// Override the message function to provide custom language localization.
  @override
  String message(UpgraderMessage messageKey) {
    if (languageCode == 'np') {
      switch (messageKey) {
        case UpgraderMessage.body:
          return 'np {{appName}} को नयाँ संस्करण अब उपलब्ध छ। तपाईको हालको संस्करण ({{currentInstalledVersion}}) हो र पछिल्लो संस्करण ({{currentAppStoreVersion}}) हो।';
        case UpgraderMessage.buttonTitleIgnore:
          return 'np बेवास्ता गर्नुहोस्';
        case UpgraderMessage.buttonTitleLater:
          return 'np पछि';
        case UpgraderMessage.buttonTitleUpdate:
          return 'np अहिले अपडेट गर्नुहोस्';
        case UpgraderMessage.prompt:
          return 'np अपडेट गर्न चाहनुहुन्छ?';
        case UpgraderMessage.releaseNotes:
          return 'np रिलिज नोटहरू';
        case UpgraderMessage.title:
          return 'np एप अपडेट गर्ने हो?';
      }
    }
    // Messages that are not provided above can still use the default values.
    return super.message(messageKey) ?? messageKey.toString();
  }
}
