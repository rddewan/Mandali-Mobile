// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'church_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChurchListResponse _$ChurchListResponseFromJson(Map<String, dynamic> json) {
  return _ChurchListResponse.fromJson(json);
}

/// @nodoc
mixin _$ChurchListResponse {
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<ChurchResponse> get data => throw _privateConstructorUsedError;

  /// Serializes this ChurchListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChurchListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChurchListResponseCopyWith<ChurchListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChurchListResponseCopyWith<$Res> {
  factory $ChurchListResponseCopyWith(
          ChurchListResponse value, $Res Function(ChurchListResponse) then) =
      _$ChurchListResponseCopyWithImpl<$Res, ChurchListResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") List<ChurchResponse> data});
}

/// @nodoc
class _$ChurchListResponseCopyWithImpl<$Res, $Val extends ChurchListResponse>
    implements $ChurchListResponseCopyWith<$Res> {
  _$ChurchListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChurchListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChurchResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChurchListResponseImplCopyWith<$Res>
    implements $ChurchListResponseCopyWith<$Res> {
  factory _$$ChurchListResponseImplCopyWith(_$ChurchListResponseImpl value,
          $Res Function(_$ChurchListResponseImpl) then) =
      __$$ChurchListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") List<ChurchResponse> data});
}

/// @nodoc
class __$$ChurchListResponseImplCopyWithImpl<$Res>
    extends _$ChurchListResponseCopyWithImpl<$Res, _$ChurchListResponseImpl>
    implements _$$ChurchListResponseImplCopyWith<$Res> {
  __$$ChurchListResponseImplCopyWithImpl(_$ChurchListResponseImpl _value,
      $Res Function(_$ChurchListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChurchListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$ChurchListResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChurchResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChurchListResponseImpl implements _ChurchListResponse {
  const _$ChurchListResponseImpl(
      {@JsonKey(name: "status") required this.status,
      @JsonKey(name: "data") final List<ChurchResponse> data = const []})
      : _data = data;

  factory _$ChurchListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChurchListResponseImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String status;
  final List<ChurchResponse> _data;
  @override
  @JsonKey(name: "data")
  List<ChurchResponse> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ChurchListResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChurchListResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ChurchListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChurchListResponseImplCopyWith<_$ChurchListResponseImpl> get copyWith =>
      __$$ChurchListResponseImplCopyWithImpl<_$ChurchListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChurchListResponseImplToJson(
      this,
    );
  }
}

abstract class _ChurchListResponse implements ChurchListResponse {
  const factory _ChurchListResponse(
          {@JsonKey(name: "status") required final String status,
          @JsonKey(name: "data") final List<ChurchResponse> data}) =
      _$ChurchListResponseImpl;

  factory _ChurchListResponse.fromJson(Map<String, dynamic> json) =
      _$ChurchListResponseImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "data")
  List<ChurchResponse> get data;

  /// Create a copy of ChurchListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChurchListResponseImplCopyWith<_$ChurchListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChurchResponse _$ChurchResponseFromJson(Map<String, dynamic> json) {
  return _ChurchResponse.fromJson(json);
}

/// @nodoc
mixin _$ChurchResponse {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ChurchResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChurchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChurchResponseCopyWith<ChurchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChurchResponseCopyWith<$Res> {
  factory $ChurchResponseCopyWith(
          ChurchResponse value, $Res Function(ChurchResponse) then) =
      _$ChurchResponseCopyWithImpl<$Res, ChurchResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});
}

/// @nodoc
class _$ChurchResponseCopyWithImpl<$Res, $Val extends ChurchResponse>
    implements $ChurchResponseCopyWith<$Res> {
  _$ChurchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChurchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChurchResponseImplCopyWith<$Res>
    implements $ChurchResponseCopyWith<$Res> {
  factory _$$ChurchResponseImplCopyWith(_$ChurchResponseImpl value,
          $Res Function(_$ChurchResponseImpl) then) =
      __$$ChurchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt});
}

/// @nodoc
class __$$ChurchResponseImplCopyWithImpl<$Res>
    extends _$ChurchResponseCopyWithImpl<$Res, _$ChurchResponseImpl>
    implements _$$ChurchResponseImplCopyWith<$Res> {
  __$$ChurchResponseImplCopyWithImpl(
      _$ChurchResponseImpl _value, $Res Function(_$ChurchResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChurchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ChurchResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
class _$ChurchResponseImpl implements _ChurchResponse {
  const _$ChurchResponseImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "address") required this.address,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt});

  factory _$ChurchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChurchResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "address")
  final String address;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ChurchResponse(id: $id, name: $name, address: $address, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChurchResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, address, createdAt, updatedAt);

  /// Create a copy of ChurchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChurchResponseImplCopyWith<_$ChurchResponseImpl> get copyWith =>
      __$$ChurchResponseImplCopyWithImpl<_$ChurchResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChurchResponseImplToJson(
      this,
    );
  }
}

abstract class _ChurchResponse implements ChurchResponse {
  const factory _ChurchResponse(
          {@JsonKey(name: "id") required final int id,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "address") required final String address,
          @JsonKey(name: "createdAt") required final DateTime createdAt,
          @JsonKey(name: "updatedAt") required final DateTime updatedAt}) =
      _$ChurchResponseImpl;

  factory _ChurchResponse.fromJson(Map<String, dynamic> json) =
      _$ChurchResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "address")
  String get address;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;

  /// Create a copy of ChurchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChurchResponseImplCopyWith<_$ChurchResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
