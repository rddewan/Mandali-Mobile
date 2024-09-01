// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneAuthResponseImpl _$$PhoneAuthResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PhoneAuthResponseImpl(
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      smsCode: json['smsCode'] as String?,
      idToken: json['idToken'] as String?,
      resendToken: (json['resendToken'] as num?)?.toInt(),
      verificationId: json['verificationId'] as String?,
      isSmsSent: json['isSmsSent'] as bool? ?? false,
      isSmsResend: json['isSmsResend'] as bool? ?? false,
    );

Map<String, dynamic> _$$PhoneAuthResponseImplToJson(
        _$PhoneAuthResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'smsCode': instance.smsCode,
      'idToken': instance.idToken,
      'resendToken': instance.resendToken,
      'verificationId': instance.verificationId,
      'isSmsSent': instance.isSmsSent,
      'isSmsResend': instance.isSmsResend,
    };
