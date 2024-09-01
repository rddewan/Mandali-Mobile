import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.dev.env')
abstract class EnvDev {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _EnvDev.baseUrl;
  @EnviedField(varName: 'CERTIFICATE', obfuscate: true)
  static final String certificate = _EnvDev.certificate;
  @EnviedField(varName: 'ANDROID_BUILD_ID')
  static const String androidBuildId = _EnvDev.androidBuildId;
  @EnviedField(varName: 'IOS_BUILD_ID')
  static const String iosBuildId = _EnvDev.iosBuildId;
  @EnviedField(varName: 'IS_CERTIFICATE_PINNING')
  static const bool isCertificatePinning = _EnvDev.isCertificatePinning;
}

@Envied(path: '.qa.env')
abstract class EnvQA {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _EnvQA.baseUrl;
  @EnviedField(varName: 'CERTIFICATE', obfuscate: true)
  static final String certificate = _EnvQA.certificate;
  @EnviedField(varName: 'ANDROID_BUILD_ID')
  static const String androidBuildId = _EnvQA.androidBuildId;
  @EnviedField(varName: 'IOS_BUILD_ID')
  static const String iosBuildId = _EnvQA.iosBuildId;
  @EnviedField(varName: 'IS_CERTIFICATE_PINNING')
  static const bool isCertificatePinning = _EnvQA.isCertificatePinning;
}

@Envied(path: '.prod.env')
abstract class EnvProd {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _EnvProd.baseUrl;
  @EnviedField(varName: 'CERTIFICATE', obfuscate: true)
  static final String certificate = _EnvProd.certificate;
  @EnviedField(varName: 'ANDROID_BUILD_ID')
  static const String androidBuildId = _EnvProd.androidBuildId;
  @EnviedField(varName: 'IOS_BUILD_ID')
  static const String iosBuildId = _EnvProd.iosBuildId;
  @EnviedField(varName: 'IS_CERTIFICATE_PINNING')
  static const bool isCertificatePinning = _EnvProd.isCertificatePinning;
}
