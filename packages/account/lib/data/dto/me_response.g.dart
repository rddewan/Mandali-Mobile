// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeResponseImpl _$$MeResponseImplFromJson(Map<String, dynamic> json) =>
    _$MeResponseImpl(
      status: json['status'] as String,
      data: UserDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MeResponseImplToJson(_$MeResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
