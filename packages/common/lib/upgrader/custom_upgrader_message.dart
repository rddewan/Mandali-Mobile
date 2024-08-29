part of common;

class CustomUpgraderMessage extends UpgraderMessages {
  @override
  String get body =>
      'A new version of {{appName}} is now available. Your current version is ({{currentInstalledVersion}}) and the latest version is ({{currentAppStoreVersion}}).';
}
