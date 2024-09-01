// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberResponseImpl _$$MemberResponseImplFromJson(Map<String, dynamic> json) =>
    _$MemberResponseImpl(
      status: json['status'] as String,
      data: MemberDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MemberResponseImplToJson(
        _$MemberResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$MemberDtoImpl _$$MemberDtoImplFromJson(Map<String, dynamic> json) =>
    _$MemberDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'],
      photo: json['photo'] as String?,
      role: (json['role'] as List<dynamic>)
          .map((e) => RoleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MemberDtoImplToJson(_$MemberDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'photo': instance.photo,
      'role': instance.role,
    };
