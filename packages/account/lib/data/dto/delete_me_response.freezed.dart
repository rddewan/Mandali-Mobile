// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_me_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteMeResponse _$DeleteMeResponseFromJson(Map<String, dynamic> json) {
  return _DeleteMeResponse.fromJson(json);
}

/// @nodoc
mixin _$DeleteMeResponse {
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  UserDto? get data => throw _privateConstructorUsedError;

  /// Serializes this DeleteMeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteMeResponseCopyWith<DeleteMeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteMeResponseCopyWith<$Res> {
  factory $DeleteMeResponseCopyWith(
          DeleteMeResponse value, $Res Function(DeleteMeResponse) then) =
      _$DeleteMeResponseCopyWithImpl<$Res, DeleteMeResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") UserDto? data});

  $UserDtoCopyWith<$Res>? get data;
}

/// @nodoc
class _$DeleteMeResponseCopyWithImpl<$Res, $Val extends DeleteMeResponse>
    implements $DeleteMeResponseCopyWith<$Res> {
  _$DeleteMeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteMeResponse
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
              as UserDto?,
    ) as $Val);
  }

  /// Create a copy of DeleteMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeleteMeResponseImplCopyWith<$Res>
    implements $DeleteMeResponseCopyWith<$Res> {
  factory _$$DeleteMeResponseImplCopyWith(_$DeleteMeResponseImpl value,
          $Res Function(_$DeleteMeResponseImpl) then) =
      __$$DeleteMeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") UserDto? data});

  @override
  $UserDtoCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DeleteMeResponseImplCopyWithImpl<$Res>
    extends _$DeleteMeResponseCopyWithImpl<$Res, _$DeleteMeResponseImpl>
    implements _$$DeleteMeResponseImplCopyWith<$Res> {
  __$$DeleteMeResponseImplCopyWithImpl(_$DeleteMeResponseImpl _value,
      $Res Function(_$DeleteMeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
  }) {
    return _then(_$DeleteMeResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteMeResponseImpl implements _DeleteMeResponse {
  const _$DeleteMeResponseImpl(
      {@JsonKey(name: "status") required this.status,
      @JsonKey(name: "data") this.data});

  factory _$DeleteMeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteMeResponseImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "data")
  final UserDto? data;

  @override
  String toString() {
    return 'DeleteMeResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMeResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  /// Create a copy of DeleteMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMeResponseImplCopyWith<_$DeleteMeResponseImpl> get copyWith =>
      __$$DeleteMeResponseImplCopyWithImpl<_$DeleteMeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteMeResponseImplToJson(
      this,
    );
  }
}

abstract class _DeleteMeResponse implements DeleteMeResponse {
  const factory _DeleteMeResponse(
      {@JsonKey(name: "status") required final String status,
      @JsonKey(name: "data") final UserDto? data}) = _$DeleteMeResponseImpl;

  factory _DeleteMeResponse.fromJson(Map<String, dynamic> json) =
      _$DeleteMeResponseImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "data")
  UserDto? get data;

  /// Create a copy of DeleteMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteMeResponseImplCopyWith<_$DeleteMeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
