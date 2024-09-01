// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemberResponse _$MemberResponseFromJson(Map<String, dynamic> json) {
  return _MemberResponse.fromJson(json);
}

/// @nodoc
mixin _$MemberResponse {
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  MemberDto get data => throw _privateConstructorUsedError;

  /// Serializes this MemberResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberResponseCopyWith<MemberResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberResponseCopyWith<$Res> {
  factory $MemberResponseCopyWith(
          MemberResponse value, $Res Function(MemberResponse) then) =
      _$MemberResponseCopyWithImpl<$Res, MemberResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") MemberDto data});

  $MemberDtoCopyWith<$Res> get data;
}

/// @nodoc
class _$MemberResponseCopyWithImpl<$Res, $Val extends MemberResponse>
    implements $MemberResponseCopyWith<$Res> {
  _$MemberResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberResponse
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
              as MemberDto,
    ) as $Val);
  }

  /// Create a copy of MemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberDtoCopyWith<$Res> get data {
    return $MemberDtoCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemberResponseImplCopyWith<$Res>
    implements $MemberResponseCopyWith<$Res> {
  factory _$$MemberResponseImplCopyWith(_$MemberResponseImpl value,
          $Res Function(_$MemberResponseImpl) then) =
      __$$MemberResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String status,
      @JsonKey(name: "data") MemberDto data});

  @override
  $MemberDtoCopyWith<$Res> get data;
}

/// @nodoc
class __$$MemberResponseImplCopyWithImpl<$Res>
    extends _$MemberResponseCopyWithImpl<$Res, _$MemberResponseImpl>
    implements _$$MemberResponseImplCopyWith<$Res> {
  __$$MemberResponseImplCopyWithImpl(
      _$MemberResponseImpl _value, $Res Function(_$MemberResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$MemberResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MemberDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberResponseImpl implements _MemberResponse {
  const _$MemberResponseImpl(
      {@JsonKey(name: "status") required this.status,
      @JsonKey(name: "data") required this.data});

  factory _$MemberResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberResponseImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "data")
  final MemberDto data;

  @override
  String toString() {
    return 'MemberResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  /// Create a copy of MemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberResponseImplCopyWith<_$MemberResponseImpl> get copyWith =>
      __$$MemberResponseImplCopyWithImpl<_$MemberResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberResponseImplToJson(
      this,
    );
  }
}

abstract class _MemberResponse implements MemberResponse {
  const factory _MemberResponse(
          {@JsonKey(name: "status") required final String status,
          @JsonKey(name: "data") required final MemberDto data}) =
      _$MemberResponseImpl;

  factory _MemberResponse.fromJson(Map<String, dynamic> json) =
      _$MemberResponseImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "data")
  MemberDto get data;

  /// Create a copy of MemberResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberResponseImplCopyWith<_$MemberResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MemberDto _$MemberDtoFromJson(Map<String, dynamic> json) {
  return _MemberDto.fromJson(json);
}

/// @nodoc
mixin _$MemberDto {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phoneNumber")
  dynamic get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "photo")
  String? get photo => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  List<RoleDto> get role => throw _privateConstructorUsedError;

  /// Serializes this MemberDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberDtoCopyWith<MemberDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberDtoCopyWith<$Res> {
  factory $MemberDtoCopyWith(MemberDto value, $Res Function(MemberDto) then) =
      _$MemberDtoCopyWithImpl<$Res, MemberDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "phoneNumber") dynamic phoneNumber,
      @JsonKey(name: "photo") String? photo,
      @JsonKey(name: "role") List<RoleDto> role});
}

/// @nodoc
class _$MemberDtoCopyWithImpl<$Res, $Val extends MemberDto>
    implements $MemberDtoCopyWith<$Res> {
  _$MemberDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = freezed,
    Object? photo = freezed,
    Object? role = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as List<RoleDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberDtoImplCopyWith<$Res>
    implements $MemberDtoCopyWith<$Res> {
  factory _$$MemberDtoImplCopyWith(
          _$MemberDtoImpl value, $Res Function(_$MemberDtoImpl) then) =
      __$$MemberDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "phoneNumber") dynamic phoneNumber,
      @JsonKey(name: "photo") String? photo,
      @JsonKey(name: "role") List<RoleDto> role});
}

/// @nodoc
class __$$MemberDtoImplCopyWithImpl<$Res>
    extends _$MemberDtoCopyWithImpl<$Res, _$MemberDtoImpl>
    implements _$$MemberDtoImplCopyWith<$Res> {
  __$$MemberDtoImplCopyWithImpl(
      _$MemberDtoImpl _value, $Res Function(_$MemberDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = freezed,
    Object? photo = freezed,
    Object? role = null,
  }) {
    return _then(_$MemberDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value._role
          : role // ignore: cast_nullable_to_non_nullable
              as List<RoleDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberDtoImpl implements _MemberDto {
  const _$MemberDtoImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "phoneNumber") required this.phoneNumber,
      @JsonKey(name: "photo") this.photo,
      @JsonKey(name: "role") required final List<RoleDto> role})
      : _role = role;

  factory _$MemberDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberDtoImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "phoneNumber")
  final dynamic phoneNumber;
  @override
  @JsonKey(name: "photo")
  final String? photo;
  final List<RoleDto> _role;
  @override
  @JsonKey(name: "role")
  List<RoleDto> get role {
    if (_role is EqualUnmodifiableListView) return _role;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_role);
  }

  @override
  String toString() {
    return 'MemberDto(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, photo: $photo, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            const DeepCollectionEquality().equals(other._role, _role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      const DeepCollectionEquality().hash(phoneNumber),
      photo,
      const DeepCollectionEquality().hash(_role));

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberDtoImplCopyWith<_$MemberDtoImpl> get copyWith =>
      __$$MemberDtoImplCopyWithImpl<_$MemberDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberDtoImplToJson(
      this,
    );
  }
}

abstract class _MemberDto implements MemberDto {
  const factory _MemberDto(
          {@JsonKey(name: "id") required final int id,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "email") required final String email,
          @JsonKey(name: "phoneNumber") required final dynamic phoneNumber,
          @JsonKey(name: "photo") final String? photo,
          @JsonKey(name: "role") required final List<RoleDto> role}) =
      _$MemberDtoImpl;

  factory _MemberDto.fromJson(Map<String, dynamic> json) =
      _$MemberDtoImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "phoneNumber")
  dynamic get phoneNumber;
  @override
  @JsonKey(name: "photo")
  String? get photo;
  @override
  @JsonKey(name: "role")
  List<RoleDto> get role;

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberDtoImplCopyWith<_$MemberDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
