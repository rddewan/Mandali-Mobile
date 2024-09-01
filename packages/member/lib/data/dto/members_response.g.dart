// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'members_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MembersResponseImpl _$$MembersResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MembersResponseImpl(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => MemberDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MembersResponseImplToJson(
        _$MembersResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
