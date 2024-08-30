// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_service_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChurchServicesResponseImpl _$$ChurchServicesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChurchServicesResponseImpl(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => ChurchServiceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: json['page'] == null
          ? const PageDto()
          : PageDto.fromJson(json['page'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChurchServicesResponseImplToJson(
        _$ChurchServicesResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'page': instance.page,
    };

_$ChurchServiceResponseImpl _$$ChurchServiceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChurchServiceResponseImpl(
      status: json['status'] as String,
      data: json['data'] == null
          ? null
          : ChurchServiceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChurchServiceResponseImplToJson(
        _$ChurchServiceResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$ChurchServiceDataImpl _$$ChurchServiceDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ChurchServiceDataImpl(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      chairPerson: json['chairPerson'] as String,
      preacher: json['preacher'] as String,
      bibleReaders: (json['bibleReaders'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      offering: json['offering'] as String?,
      worship: json['worship'] as String?,
      serviceType: $enumDecode(_$ChurchServiceTypeEnumMap, json['serviceType']),
      createdBy: (json['createdBy'] as num).toInt(),
      createAt: DateTime.parse(json['createAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ChurchServiceDataImplToJson(
        _$ChurchServiceDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'chairPerson': instance.chairPerson,
      'preacher': instance.preacher,
      'bibleReaders': instance.bibleReaders,
      'offering': instance.offering,
      'worship': instance.worship,
      'serviceType': _$ChurchServiceTypeEnumMap[instance.serviceType]!,
      'createdBy': instance.createdBy,
      'createAt': instance.createAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ChurchServiceTypeEnumMap = {
  ChurchServiceType.sunday: 'sunday',
  ChurchServiceType.cottage: 'cottage',
};

_$PageDtoImpl _$$PageDtoImplFromJson(Map<String, dynamic> json) =>
    _$PageDtoImpl(
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 1,
      total: (json['total'] as num?)?.toInt() ?? 0,
      totalPage: (json['totalPage'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PageDtoImplToJson(_$PageDtoImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'total': instance.total,
      'totalPage': instance.totalPage,
    };
