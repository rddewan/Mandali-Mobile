// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'church_service_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChurchServicesResponse _$ChurchServicesResponseFromJson(
    Map<String, dynamic> json) {
  return _ChurchServicesResponse.fromJson(json);
}

/// @nodoc
mixin _$ChurchServicesResponse {
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<ChurchServiceData> get data => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  PageDto get page => throw _privateConstructorUsedError;

  /// Serializes this ChurchServicesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChurchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChurchServicesResponseCopyWith<ChurchServicesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChurchServicesResponseCopyWith<$Res> {
  factory $ChurchServicesResponseCopyWith(ChurchServicesResponse value,
          $Res Function(ChurchServicesResponse) then) =
      _$ChurchServicesResponseCopyWithImpl<$Res, ChurchServicesResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") List<ChurchServiceData> data,
      @JsonKey(name: "page") PageDto page});

  $PageDtoCopyWith<$Res> get page;
}

/// @nodoc
class _$ChurchServicesResponseCopyWithImpl<$Res,
        $Val extends ChurchServicesResponse>
    implements $ChurchServicesResponseCopyWith<$Res> {
  _$ChurchServicesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChurchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChurchServiceData>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PageDto,
    ) as $Val);
  }

  /// Create a copy of ChurchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageDtoCopyWith<$Res> get page {
    return $PageDtoCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChurchServicesResponseImplCopyWith<$Res>
    implements $ChurchServicesResponseCopyWith<$Res> {
  factory _$$ChurchServicesResponseImplCopyWith(
          _$ChurchServicesResponseImpl value,
          $Res Function(_$ChurchServicesResponseImpl) then) =
      __$$ChurchServicesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") List<ChurchServiceData> data,
      @JsonKey(name: "page") PageDto page});

  @override
  $PageDtoCopyWith<$Res> get page;
}

/// @nodoc
class __$$ChurchServicesResponseImplCopyWithImpl<$Res>
    extends _$ChurchServicesResponseCopyWithImpl<$Res,
        _$ChurchServicesResponseImpl>
    implements _$$ChurchServicesResponseImplCopyWith<$Res> {
  __$$ChurchServicesResponseImplCopyWithImpl(
      _$ChurchServicesResponseImpl _value,
      $Res Function(_$ChurchServicesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChurchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? page = null,
  }) {
    return _then(_$ChurchServicesResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChurchServiceData>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PageDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChurchServicesResponseImpl implements _ChurchServicesResponse {
  const _$ChurchServicesResponseImpl(
      {@JsonKey(name: "status") required this.status,
      @JsonKey(name: "data") final List<ChurchServiceData> data = const [],
      @JsonKey(name: "page") this.page = const PageDto()})
      : _data = data;

  factory _$ChurchServicesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChurchServicesResponseImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String status;
  final List<ChurchServiceData> _data;
  @override
  @JsonKey(name: "data")
  List<ChurchServiceData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: "page")
  final PageDto page;

  @override
  String toString() {
    return 'ChurchServicesResponse(status: $status, data: $data, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChurchServicesResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data), page);

  /// Create a copy of ChurchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChurchServicesResponseImplCopyWith<_$ChurchServicesResponseImpl>
      get copyWith => __$$ChurchServicesResponseImplCopyWithImpl<
          _$ChurchServicesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChurchServicesResponseImplToJson(
      this,
    );
  }
}

abstract class _ChurchServicesResponse implements ChurchServicesResponse {
  const factory _ChurchServicesResponse(
          {@JsonKey(name: "status") required final String status,
          @JsonKey(name: "data") final List<ChurchServiceData> data,
          @JsonKey(name: "page") final PageDto page}) =
      _$ChurchServicesResponseImpl;

  factory _ChurchServicesResponse.fromJson(Map<String, dynamic> json) =
      _$ChurchServicesResponseImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "data")
  List<ChurchServiceData> get data;
  @override
  @JsonKey(name: "page")
  PageDto get page;

  /// Create a copy of ChurchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChurchServicesResponseImplCopyWith<_$ChurchServicesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChurchServiceResponse _$ChurchServiceResponseFromJson(
    Map<String, dynamic> json) {
  return _ChurchServiceResponse.fromJson(json);
}

/// @nodoc
mixin _$ChurchServiceResponse {
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  ChurchServiceData? get data => throw _privateConstructorUsedError;

  /// Serializes this ChurchServiceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChurchServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChurchServiceResponseCopyWith<ChurchServiceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChurchServiceResponseCopyWith<$Res> {
  factory $ChurchServiceResponseCopyWith(ChurchServiceResponse value,
          $Res Function(ChurchServiceResponse) then) =
      _$ChurchServiceResponseCopyWithImpl<$Res, ChurchServiceResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") ChurchServiceData? data});

  $ChurchServiceDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ChurchServiceResponseCopyWithImpl<$Res,
        $Val extends ChurchServiceResponse>
    implements $ChurchServiceResponseCopyWith<$Res> {
  _$ChurchServiceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChurchServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ChurchServiceData?,
    ) as $Val);
  }

  /// Create a copy of ChurchServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChurchServiceDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ChurchServiceDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChurchServiceResponseImplCopyWith<$Res>
    implements $ChurchServiceResponseCopyWith<$Res> {
  factory _$$ChurchServiceResponseImplCopyWith(
          _$ChurchServiceResponseImpl value,
          $Res Function(_$ChurchServiceResponseImpl) then) =
      __$$ChurchServiceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") ChurchServiceData? data});

  @override
  $ChurchServiceDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ChurchServiceResponseImplCopyWithImpl<$Res>
    extends _$ChurchServiceResponseCopyWithImpl<$Res,
        _$ChurchServiceResponseImpl>
    implements _$$ChurchServiceResponseImplCopyWith<$Res> {
  __$$ChurchServiceResponseImplCopyWithImpl(_$ChurchServiceResponseImpl _value,
      $Res Function(_$ChurchServiceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChurchServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
  }) {
    return _then(_$ChurchServiceResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ChurchServiceData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChurchServiceResponseImpl implements _ChurchServiceResponse {
  const _$ChurchServiceResponseImpl(
      {@JsonKey(name: "status") required this.status,
      @JsonKey(name: "data") this.data});

  factory _$ChurchServiceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChurchServiceResponseImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "data")
  final ChurchServiceData? data;

  @override
  String toString() {
    return 'ChurchServiceResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChurchServiceResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  /// Create a copy of ChurchServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChurchServiceResponseImplCopyWith<_$ChurchServiceResponseImpl>
      get copyWith => __$$ChurchServiceResponseImplCopyWithImpl<
          _$ChurchServiceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChurchServiceResponseImplToJson(
      this,
    );
  }
}

abstract class _ChurchServiceResponse implements ChurchServiceResponse {
  const factory _ChurchServiceResponse(
          {@JsonKey(name: "status") required final String status,
          @JsonKey(name: "data") final ChurchServiceData? data}) =
      _$ChurchServiceResponseImpl;

  factory _ChurchServiceResponse.fromJson(Map<String, dynamic> json) =
      _$ChurchServiceResponseImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "data")
  ChurchServiceData? get data;

  /// Create a copy of ChurchServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChurchServiceResponseImplCopyWith<_$ChurchServiceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChurchServiceData _$ChurchServiceDataFromJson(Map<String, dynamic> json) {
  return _ChurchServiceData.fromJson(json);
}

/// @nodoc
mixin _$ChurchServiceData {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: "chairPerson")
  String get chairPerson => throw _privateConstructorUsedError;
  @JsonKey(name: "preacher")
  String get preacher => throw _privateConstructorUsedError;
  @JsonKey(name: "bibleReaders")
  List<String> get bibleReaders => throw _privateConstructorUsedError;
  @JsonKey(name: "offering")
  String? get offering => throw _privateConstructorUsedError;
  @JsonKey(name: "worship")
  String? get worship => throw _privateConstructorUsedError;
  @JsonKey(name: "serviceType")
  ChurchServiceType get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: "createdBy")
  int get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "createAt")
  DateTime get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ChurchServiceData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChurchServiceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChurchServiceDataCopyWith<ChurchServiceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChurchServiceDataCopyWith<$Res> {
  factory $ChurchServiceDataCopyWith(
          ChurchServiceData value, $Res Function(ChurchServiceData) then) =
      _$ChurchServiceDataCopyWithImpl<$Res, ChurchServiceData>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "date") DateTime date,
      @JsonKey(name: "chairPerson") String chairPerson,
      @JsonKey(name: "preacher") String preacher,
      @JsonKey(name: "bibleReaders") List<String> bibleReaders,
      @JsonKey(name: "offering") String? offering,
      @JsonKey(name: "worship") String? worship,
      @JsonKey(name: "serviceType") ChurchServiceType serviceType,
      @JsonKey(name: "createdBy") int createdBy,
      @JsonKey(name: "createAt") DateTime createAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});
}

/// @nodoc
class _$ChurchServiceDataCopyWithImpl<$Res, $Val extends ChurchServiceData>
    implements $ChurchServiceDataCopyWith<$Res> {
  _$ChurchServiceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChurchServiceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? chairPerson = null,
    Object? preacher = null,
    Object? bibleReaders = null,
    Object? offering = freezed,
    Object? worship = freezed,
    Object? serviceType = null,
    Object? createdBy = null,
    Object? createAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      chairPerson: null == chairPerson
          ? _value.chairPerson
          : chairPerson // ignore: cast_nullable_to_non_nullable
              as String,
      preacher: null == preacher
          ? _value.preacher
          : preacher // ignore: cast_nullable_to_non_nullable
              as String,
      bibleReaders: null == bibleReaders
          ? _value.bibleReaders
          : bibleReaders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      offering: freezed == offering
          ? _value.offering
          : offering // ignore: cast_nullable_to_non_nullable
              as String?,
      worship: freezed == worship
          ? _value.worship
          : worship // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ChurchServiceType,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChurchServiceDataImplCopyWith<$Res>
    implements $ChurchServiceDataCopyWith<$Res> {
  factory _$$ChurchServiceDataImplCopyWith(_$ChurchServiceDataImpl value,
          $Res Function(_$ChurchServiceDataImpl) then) =
      __$$ChurchServiceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "date") DateTime date,
      @JsonKey(name: "chairPerson") String chairPerson,
      @JsonKey(name: "preacher") String preacher,
      @JsonKey(name: "bibleReaders") List<String> bibleReaders,
      @JsonKey(name: "offering") String? offering,
      @JsonKey(name: "worship") String? worship,
      @JsonKey(name: "serviceType") ChurchServiceType serviceType,
      @JsonKey(name: "createdBy") int createdBy,
      @JsonKey(name: "createAt") DateTime createAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});
}

/// @nodoc
class __$$ChurchServiceDataImplCopyWithImpl<$Res>
    extends _$ChurchServiceDataCopyWithImpl<$Res, _$ChurchServiceDataImpl>
    implements _$$ChurchServiceDataImplCopyWith<$Res> {
  __$$ChurchServiceDataImplCopyWithImpl(_$ChurchServiceDataImpl _value,
      $Res Function(_$ChurchServiceDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChurchServiceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? chairPerson = null,
    Object? preacher = null,
    Object? bibleReaders = null,
    Object? offering = freezed,
    Object? worship = freezed,
    Object? serviceType = null,
    Object? createdBy = null,
    Object? createAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ChurchServiceDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      chairPerson: null == chairPerson
          ? _value.chairPerson
          : chairPerson // ignore: cast_nullable_to_non_nullable
              as String,
      preacher: null == preacher
          ? _value.preacher
          : preacher // ignore: cast_nullable_to_non_nullable
              as String,
      bibleReaders: null == bibleReaders
          ? _value._bibleReaders
          : bibleReaders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      offering: freezed == offering
          ? _value.offering
          : offering // ignore: cast_nullable_to_non_nullable
              as String?,
      worship: freezed == worship
          ? _value.worship
          : worship // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ChurchServiceType,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChurchServiceDataImpl implements _ChurchServiceData {
  const _$ChurchServiceDataImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "date") required this.date,
      @JsonKey(name: "chairPerson") required this.chairPerson,
      @JsonKey(name: "preacher") required this.preacher,
      @JsonKey(name: "bibleReaders") final List<String> bibleReaders = const [],
      @JsonKey(name: "offering") this.offering,
      @JsonKey(name: "worship") this.worship,
      @JsonKey(name: "serviceType") required this.serviceType,
      @JsonKey(name: "createdBy") required this.createdBy,
      @JsonKey(name: "createAt") required this.createAt,
      @JsonKey(name: "updatedAt") required this.updatedAt})
      : _bibleReaders = bibleReaders;

  factory _$ChurchServiceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChurchServiceDataImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "date")
  final DateTime date;
  @override
  @JsonKey(name: "chairPerson")
  final String chairPerson;
  @override
  @JsonKey(name: "preacher")
  final String preacher;
  final List<String> _bibleReaders;
  @override
  @JsonKey(name: "bibleReaders")
  List<String> get bibleReaders {
    if (_bibleReaders is EqualUnmodifiableListView) return _bibleReaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bibleReaders);
  }

  @override
  @JsonKey(name: "offering")
  final String? offering;
  @override
  @JsonKey(name: "worship")
  final String? worship;
  @override
  @JsonKey(name: "serviceType")
  final ChurchServiceType serviceType;
  @override
  @JsonKey(name: "createdBy")
  final int createdBy;
  @override
  @JsonKey(name: "createAt")
  final DateTime createAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ChurchServiceData(id: $id, date: $date, chairPerson: $chairPerson, preacher: $preacher, bibleReaders: $bibleReaders, offering: $offering, worship: $worship, serviceType: $serviceType, createdBy: $createdBy, createAt: $createAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChurchServiceDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.chairPerson, chairPerson) ||
                other.chairPerson == chairPerson) &&
            (identical(other.preacher, preacher) ||
                other.preacher == preacher) &&
            const DeepCollectionEquality()
                .equals(other._bibleReaders, _bibleReaders) &&
            (identical(other.offering, offering) ||
                other.offering == offering) &&
            (identical(other.worship, worship) || other.worship == worship) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      chairPerson,
      preacher,
      const DeepCollectionEquality().hash(_bibleReaders),
      offering,
      worship,
      serviceType,
      createdBy,
      createAt,
      updatedAt);

  /// Create a copy of ChurchServiceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChurchServiceDataImplCopyWith<_$ChurchServiceDataImpl> get copyWith =>
      __$$ChurchServiceDataImplCopyWithImpl<_$ChurchServiceDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChurchServiceDataImplToJson(
      this,
    );
  }
}

abstract class _ChurchServiceData implements ChurchServiceData {
  const factory _ChurchServiceData(
          {@JsonKey(name: "id") required final int id,
          @JsonKey(name: "date") required final DateTime date,
          @JsonKey(name: "chairPerson") required final String chairPerson,
          @JsonKey(name: "preacher") required final String preacher,
          @JsonKey(name: "bibleReaders") final List<String> bibleReaders,
          @JsonKey(name: "offering") final String? offering,
          @JsonKey(name: "worship") final String? worship,
          @JsonKey(name: "serviceType")
          required final ChurchServiceType serviceType,
          @JsonKey(name: "createdBy") required final int createdBy,
          @JsonKey(name: "createAt") required final DateTime createAt,
          @JsonKey(name: "updatedAt") required final DateTime updatedAt}) =
      _$ChurchServiceDataImpl;

  factory _ChurchServiceData.fromJson(Map<String, dynamic> json) =
      _$ChurchServiceDataImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "date")
  DateTime get date;
  @override
  @JsonKey(name: "chairPerson")
  String get chairPerson;
  @override
  @JsonKey(name: "preacher")
  String get preacher;
  @override
  @JsonKey(name: "bibleReaders")
  List<String> get bibleReaders;
  @override
  @JsonKey(name: "offering")
  String? get offering;
  @override
  @JsonKey(name: "worship")
  String? get worship;
  @override
  @JsonKey(name: "serviceType")
  ChurchServiceType get serviceType;
  @override
  @JsonKey(name: "createdBy")
  int get createdBy;
  @override
  @JsonKey(name: "createAt")
  DateTime get createAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;

  /// Create a copy of ChurchServiceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChurchServiceDataImplCopyWith<_$ChurchServiceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PageDto _$PageDtoFromJson(Map<String, dynamic> json) {
  return _PageDto.fromJson(json);
}

/// @nodoc
mixin _$PageDto {
  @JsonKey(name: "currentPage")
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: "totalPage")
  int get totalPage => throw _privateConstructorUsedError;

  /// Serializes this PageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageDtoCopyWith<PageDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageDtoCopyWith<$Res> {
  factory $PageDtoCopyWith(PageDto value, $Res Function(PageDto) then) =
      _$PageDtoCopyWithImpl<$Res, PageDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "currentPage") int currentPage,
      @JsonKey(name: "total") int total,
      @JsonKey(name: "totalPage") int totalPage});
}

/// @nodoc
class _$PageDtoCopyWithImpl<$Res, $Val extends PageDto>
    implements $PageDtoCopyWith<$Res> {
  _$PageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? total = null,
    Object? totalPage = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageDtoImplCopyWith<$Res> implements $PageDtoCopyWith<$Res> {
  factory _$$PageDtoImplCopyWith(
          _$PageDtoImpl value, $Res Function(_$PageDtoImpl) then) =
      __$$PageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "currentPage") int currentPage,
      @JsonKey(name: "total") int total,
      @JsonKey(name: "totalPage") int totalPage});
}

/// @nodoc
class __$$PageDtoImplCopyWithImpl<$Res>
    extends _$PageDtoCopyWithImpl<$Res, _$PageDtoImpl>
    implements _$$PageDtoImplCopyWith<$Res> {
  __$$PageDtoImplCopyWithImpl(
      _$PageDtoImpl _value, $Res Function(_$PageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? total = null,
    Object? totalPage = null,
  }) {
    return _then(_$PageDtoImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageDtoImpl implements _PageDto {
  const _$PageDtoImpl(
      {@JsonKey(name: "currentPage") this.currentPage = 1,
      @JsonKey(name: "total") this.total = 0,
      @JsonKey(name: "totalPage") this.totalPage = 0});

  factory _$PageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageDtoImplFromJson(json);

  @override
  @JsonKey(name: "currentPage")
  final int currentPage;
  @override
  @JsonKey(name: "total")
  final int total;
  @override
  @JsonKey(name: "totalPage")
  final int totalPage;

  @override
  String toString() {
    return 'PageDto(currentPage: $currentPage, total: $total, totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageDtoImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, total, totalPage);

  /// Create a copy of PageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageDtoImplCopyWith<_$PageDtoImpl> get copyWith =>
      __$$PageDtoImplCopyWithImpl<_$PageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageDtoImplToJson(
      this,
    );
  }
}

abstract class _PageDto implements PageDto {
  const factory _PageDto(
      {@JsonKey(name: "currentPage") final int currentPage,
      @JsonKey(name: "total") final int total,
      @JsonKey(name: "totalPage") final int totalPage}) = _$PageDtoImpl;

  factory _PageDto.fromJson(Map<String, dynamic> json) = _$PageDtoImpl.fromJson;

  @override
  @JsonKey(name: "currentPage")
  int get currentPage;
  @override
  @JsonKey(name: "total")
  int get total;
  @override
  @JsonKey(name: "totalPage")
  int get totalPage;

  /// Create a copy of PageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageDtoImplCopyWith<_$PageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
