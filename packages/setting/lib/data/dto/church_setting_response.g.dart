// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_setting_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChurchSettingResponseImpl _$$ChurchSettingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChurchSettingResponseImpl(
      status: json['status'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChurchSettingResponseImplToJson(
        _$ChurchSettingResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: (json['id'] as num).toInt(),
      churchId: (json['churchId'] as num).toInt(),
      timeZone: json['timeZone'] as String,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'timeZone': instance.timeZone,
    };
