// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_me_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteMeResponseImpl _$$DeleteMeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteMeResponseImpl(
      status: json['status'] as String,
      data: json['data'] == null
          ? null
          : UserDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DeleteMeResponseImplToJson(
        _$DeleteMeResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
