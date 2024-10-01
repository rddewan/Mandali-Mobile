// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_photo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfilePhotoResponse _$ProfilePhotoResponseFromJson(Map<String, dynamic> json) {
  return _ProfilePhotoResponse.fromJson(json);
}

/// @nodoc
mixin _$ProfilePhotoResponse {
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  String get data => throw _privateConstructorUsedError;

  /// Serializes this ProfilePhotoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfilePhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfilePhotoResponseCopyWith<ProfilePhotoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePhotoResponseCopyWith<$Res> {
  factory $ProfilePhotoResponseCopyWith(ProfilePhotoResponse value,
          $Res Function(ProfilePhotoResponse) then) =
      _$ProfilePhotoResponseCopyWithImpl<$Res, ProfilePhotoResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") String data});
}

/// @nodoc
class _$ProfilePhotoResponseCopyWithImpl<$Res,
        $Val extends ProfilePhotoResponse>
    implements $ProfilePhotoResponseCopyWith<$Res> {
  _$ProfilePhotoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilePhotoResponse
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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfilePhotoResponseImplCopyWith<$Res>
    implements $ProfilePhotoResponseCopyWith<$Res> {
  factory _$$ProfilePhotoResponseImplCopyWith(_$ProfilePhotoResponseImpl value,
          $Res Function(_$ProfilePhotoResponseImpl) then) =
      __$$ProfilePhotoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") String data});
}

/// @nodoc
class __$$ProfilePhotoResponseImplCopyWithImpl<$Res>
    extends _$ProfilePhotoResponseCopyWithImpl<$Res, _$ProfilePhotoResponseImpl>
    implements _$$ProfilePhotoResponseImplCopyWith<$Res> {
  __$$ProfilePhotoResponseImplCopyWithImpl(_$ProfilePhotoResponseImpl _value,
      $Res Function(_$ProfilePhotoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilePhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$ProfilePhotoResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfilePhotoResponseImpl implements _ProfilePhotoResponse {
  const _$ProfilePhotoResponseImpl(
      {@JsonKey(name: "status") required this.status,
      @JsonKey(name: "data") required this.data});

  factory _$ProfilePhotoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfilePhotoResponseImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "data")
  final String data;

  @override
  String toString() {
    return 'ProfilePhotoResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePhotoResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  /// Create a copy of ProfilePhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilePhotoResponseImplCopyWith<_$ProfilePhotoResponseImpl>
      get copyWith =>
          __$$ProfilePhotoResponseImplCopyWithImpl<_$ProfilePhotoResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfilePhotoResponseImplToJson(
      this,
    );
  }
}

abstract class _ProfilePhotoResponse implements ProfilePhotoResponse {
  const factory _ProfilePhotoResponse(
          {@JsonKey(name: "status") required final String status,
          @JsonKey(name: "data") required final String data}) =
      _$ProfilePhotoResponseImpl;

  factory _ProfilePhotoResponse.fromJson(Map<String, dynamic> json) =
      _$ProfilePhotoResponseImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "data")
  String get data;

  /// Create a copy of ProfilePhotoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilePhotoResponseImplCopyWith<_$ProfilePhotoResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
