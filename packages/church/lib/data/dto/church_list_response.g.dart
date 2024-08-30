// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChurchListResponseImpl _$$ChurchListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChurchListResponseImpl(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ChurchResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChurchListResponseImplToJson(
        _$ChurchListResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$ChurchResponseImpl _$$ChurchResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChurchResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ChurchResponseImplToJson(
        _$ChurchResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
