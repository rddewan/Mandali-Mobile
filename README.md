# Mandali
Church Management System - Open Source Project.

# Build Status
| Environment | Status  |
| ----------- | ----------- |
| Production  | [![Codemagic build status](https://api.codemagic.io/apps/66ce7c73fc5151e0782347a3/android_ios_build_prod/status_badge.svg)](https://codemagic.io/app/<app-id>/<workflow-id>/latest_build)         |
| Staging     | [![Codemagic build status](https://api.codemagic.io/apps/66ce7c73fc5151e0782347a3/android_ios_build_qa/status_badge.svg)](https://codemagic.io/app/<app-id>/<workflow-id>/latest_build)           |
| Development | [![Codemagic build status](https://api.codemagic.io/apps/66ce7c73fc5151e0782347a3/android_ios_build_dev/status_badge.svg)](https://codemagic.io/app/<app-id>/<workflow-id>/latest_build) |
| Hotfix      | -      | 
| Patch       | -       |


# Projects

| Project               | URL                                         |
| --------------------- | ------------------------------------------- |
| BE API (NestJS)       | https://github.com/rddewan/Mandali-Server   |
| FE Admin (React)      | Comming Soon!                               |
| FE Mobile (Flutter)   | https://github.com/rddewan/mandali-mobile   |


# Git Branching

| Environment | Git Branch  |
| ----------- | ----------- |
| Production  | main        |
| Staging     | qa          |
| Development | dev         |
| Hotfix      | hotfix      | 
| Patch       | patch       |

### Setup Flutter Version Management
- Run below command to setup flutter version
- Current version for this project is 3.22.2
- Docs : https://fvm.app/docs/getting_started/overview

```
# install the flutter version using fvm
fvm install 3.24.1

# select the flutter version for current project
fvm use 3.24.1

# use fvm command to proxy your flutter command
fvm flutter pub get
fvm flutter pub run build_runner build -d

```

### Setup Flutter Translation Sheet
*   This project make use of `flutter_translation_sheet` which enables us to make use of Google Sheet
*   Package: https://pub.dev/packages/flutter_translation_sheet
*   Wiki: https://github.com/roipeker/flutter_translation_sheet/wiki
*   Once you create the Google credentials `https://github.com/roipeker/flutter_translation_sheet/wiki/Google-credentials` 
*   Downalod the file and rename it to `credentials.json` 
*   Add the `credentials.json` to the project root `packages/common`
*   Run `fvm dart pub global activate flutter_translation_sheet`
*   Run: `fvm dart run flutter_translation_sheet:main run` to generate the translation file
*   Run `fvm dart run flutter_translation_sheet:main fetch` to fetch the existing translation data from Google Sheet

### Build Runner 
*   Run Build Runner Clean
    ```bash 
    ./run_build_clean.sh
    ```
*   Run Build Runner
    ```bash 
    ./run_build_runner.sh
    ```

### Setup ENV
*   Setup .env in packages/core 
    ```
    1. Rename .dev.env.example to .dev.env
    2. Rename .qa.env.example to .dev.env
    3. Rename .prod.env.example to .dev.env
    4. Add the required values to the keys
    ```

### Setup Firebase Project
*   ```
    1. Create a 3 firebase project for development, QA/Staging, Production
    2. For each Firebase Project enable Firebase Authentication Provider - Phone
    ```

### Setup Android

*   Android google-services.json
    1. Downlaod the google-services.json
    2. Add the download file to 
    ``` 
    android/app/src/dev
    android/app/src/qa
    android/app/src/prod 
    ```
*   Android Code Signing - Required for local build and for CI/CD use Secret and Environment Variable from provider
    1. Generate a Keystore file
        ```bash
        keytool -genkeypair -v -keystore mobileacademy.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias mobileacademy
        ```
    2. Copy `mobileacademy.jks` to `android/keystores`
    3. Create `key.properties` at `android/key.properties` and set below detail
        ```
        dev.keyAlias=YOUR-KEY_ALIAS
        dev.keyPassword=YOUR-KEY-PASSWORD
        dev.storeFile=../keystores/mobileacademy.jks
        dev.storePassword=YOUR-STORE-PASSWORD

        qa.keyAlias=YOUR-KEY_ALIAS
        qa.keyPassword=YOUR-KEY-PASSWORD
        qa.storeFile=../keystores/dewan.jks
        qa.storePassword=YOUR-STORE-PASSWORD

        prod.keyAlias=YOUR-KEY_ALIAS
        prod.keyPassword=YOUR-KEY-PASSWORD
        prod.storeFile=../keystores/mobileacademy.jks
        prod.storePassword=YOUR-STORE-PASSWORD
        ```
    4. In your `local.properties` at `android/local.properties` add the below data at the end of the file
        ```
        flutter.versionName=0.1.0
        flutter.minSdkVersion=25
        flutter.targetSdkVersion=34
        flutter.compileSdkVersion=34
        ``` 
* `Note: If you want to publish the app to app store you need to change the package name`

### Setup iOS

*   iOS GoogleService-Info.plist
    1. Downlaod the GoogleService-Info.plist
    2. Add the download file to 
    ``` 
    ios/Runner/Dev
    ios/Runner/QA
    ios/Runner/Prod 
    ```
*   iOS Code Signing 
    1. Login to your apple account and create a Certificate, Identifier, Provisioning Profile
    2. Identifier should include a Push Notification
    3. Download the Provisioning Profile and copy it to `/Users/YOUR-USER/Library/MobileDevice/Provisioning Profiles`
    4. Open the project in XCode select `Runner->TARGETS->Runner->Build Phases->Firebase Crashlytics` and replace your `GOOGLE_APP_ID` from GoogleService-Info.plist
    5. Configure `ios/export_options.plist` to match your signing config - Only required if you are using `shorebird` to build and patch locally 
  
* `Note: If you want to publish the app to app store you need to change the package name`


#   Useful command

## Flutter Build Android release app locally
*  Build a Dev version 
    ```bash
    fvm flutter build apk --release --build-name=1.0.0 --build-number=1 --obfuscate --split-debug-info=build/app/symbols --flavor dev -t lib/main_dev.dart
    ```    
* Build QA version
    ```bash
    fvm flutter build appbundle --release --build-name=1.0.0 --build-number=1 --obfuscate --split-debug-info=build/app/symbols --flavor qa -t lib/main_qa.dart
    ```
* Build Prod version
    ```bash
    fvm flutter build appbundle --release --build-name=1.0.0 --build-number=1 --obfuscate --split-debug-info=build/app/symbols --flavor prod -t lib/main_prod.dart
    ```

## Flutter Build iOS release app locally
* Build Dev version
    ```bash
    fvm flutter build ipa --release --obfuscate --split-debug-info=build/ios/symbols --flavor dev -t lib/main_dev.dart
    ```
* Build QA version
    ```bash
    fvm flutter build ipa --release  --obfuscate --split-debug-info=build/ios/symbols --build-name=1.0.0 --build-number=1 --flavor qa -t lib/main_qa.dart
    ```
* Build Prod version
    ```bash
    fvm flutter build ipa --release  --obfuscate --split-debug-info=build/ios/symbols  --build-name=1.0.0 --build-number=1 --flavor prod -t lib/main_prod.dart
    ```
    
### Shorebird
* Build Flavor Dev
    ```bash
    shorebird debug ios --build-name=1.0.0 --build-number=1  --flavor dev --export-options-plist ios/export_options.plist -t lib/main_dev.dart
    ```
    ```bash
    shorebird debug android --build-name=1.0.0 --build-number=1  --flavor dev -t lib/main_dev.dart
    ```
* Build Flavor QA
    ```bash
    shorebird release ios --build-name=1.0.0 --build-number=1  --flavor qa --export-options-plist ios/export_options.plist -t lib/main_qa.dart
    ```
    ```bash
    shorebird release android --build-name=1.0.0 --build-number=1  --flavor qa -t lib/main_qa.dart
    ```
* Build Flavor Prod
    ```bash
    shorebird release ios --build-name=1.0.0 --build-number=1 --flavor prod --export-options-plist ios/export_options.plist -t lib/main_prod.dart
    ```
    ```bash
    shorebird release android --build-name=1.0.0 --build-number=1 --flavor prod -t lib/main_prod.dart
    ```

* Patch Flavor Prod - Note: without the --release-version option will patch the current version of the app.
    ```bash
    shorebird patch --platforms=android --flavor=prod --target=lib/main_prod.dart --release-version=1.0.0+1
    ```

    ```bash
    shorebird patch --platforms=ios --flavor=prod --target=lib/main_prod.dart --release-version=1.0.0+1
    ```

    ```bash
    shorebird patch --platforms=android --flavor=prod --target=lib/main_prod.dart    
    ```
    ```bash
    shorebird patch --platforms=ios --flavor=prod --target=lib/main_prod.dart    
    ```

#### Git Hook
* `git config core.hooksPath .githooks/` - configure Git to look for the hooks in the given directory `.githooks/`.

#### Create Package Command
```bash 
flutter create --template=package your-package-name
```

#### List SHA1 and SHA256 for android Keystore - default password `android`
*   ```bash
    keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore
    ```

### Error
*   `Error: CocoaPods not installed or not in valid state.`
    ```
    1. fvm flutter clean
    2. fvm flutter pub get
    3. Quit the VS Code (Not close but quit)
    ```