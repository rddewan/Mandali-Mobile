// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'me_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MeResponse _$MeResponseFromJson(Map<String, dynamic> json) {
  return _MeResponse.fromJson(json);
}

/// @nodoc
mixin _$MeResponse {
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  UserDto get data => throw _privateConstructorUsedError;

  /// Serializes this MeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeResponseCopyWith<MeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeResponseCopyWith<$Res> {
  factory $MeResponseCopyWith(
          MeResponse value, $Res Function(MeResponse) then) =
      _$MeResponseCopyWithImpl<$Res, MeResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") UserDto data});

  $UserDtoCopyWith<$Res> get data;
}

/// @nodoc
class _$MeResponseCopyWithImpl<$Res, $Val extends MeResponse>
    implements $MeResponseCopyWith<$Res> {
  _$MeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeResponse
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
              as UserDto,
    ) as $Val);
  }

  /// Create a copy of MeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get data {
    return $UserDtoCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MeResponseImplCopyWith<$Res>
    implements $MeResponseCopyWith<$Res> {
  factory _$$MeResponseImplCopyWith(
          _$MeResponseImpl value, $Res Function(_$MeResponseImpl) then) =
      __$$MeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") UserDto data});

  @override
  $UserDtoCopyWith<$Res> get data;
}

/// @nodoc
class __$$MeResponseImplCopyWithImpl<$Res>
    extends _$MeResponseCopyWithImpl<$Res, _$MeResponseImpl>
    implements _$$MeResponseImplCopyWith<$Res> {
  __$$MeResponseImplCopyWithImpl(
      _$MeResponseImpl _value, $Res Function(_$MeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$MeResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeResponseImpl implements _MeResponse {
  const _$MeResponseImpl(
      {@JsonKey(name: "status") required this.status,
      @JsonKey(name: "data") required this.data});

  factory _$MeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeResponseImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "data")
  final UserDto data;

  @override
  String toString() {
    return 'MeResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  /// Create a copy of MeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeResponseImplCopyWith<_$MeResponseImpl> get copyWith =>
      __$$MeResponseImplCopyWithImpl<_$MeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeResponseImplToJson(
      this,
    );
  }
}

abstract class _MeResponse implements MeResponse {
  const factory _MeResponse(
      {@JsonKey(name: "status") required final String status,
      @JsonKey(name: "data") required final UserDto data}) = _$MeResponseImpl;

  factory _MeResponse.fromJson(Map<String, dynamic> json) =
      _$MeResponseImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "data")
  UserDto get data;

  /// Create a copy of MeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeResponseImplCopyWith<_$MeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
