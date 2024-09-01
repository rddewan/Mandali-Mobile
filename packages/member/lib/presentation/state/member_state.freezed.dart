// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemberState {
  bool get isLoading => throw _privateConstructorUsedError;
  AsyncValue<List<MemberModel>> get members =>
      throw _privateConstructorUsedError;
  MemberModel? get member => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberStateCopyWith<MemberState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberStateCopyWith<$Res> {
  factory $MemberStateCopyWith(
          MemberState value, $Res Function(MemberState) then) =
      _$MemberStateCopyWithImpl<$Res, MemberState>;
  @useResult
  $Res call(
      {bool isLoading,
      AsyncValue<List<MemberModel>> members,
      MemberModel? member,
      String? errorMsg,
      int? statusCode});

  $MemberModelCopyWith<$Res>? get member;
}

/// @nodoc
class _$MemberStateCopyWithImpl<$Res, $Val extends MemberState>
    implements $MemberStateCopyWith<$Res> {
  _$MemberStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? members = null,
    Object? member = freezed,
    Object? errorMsg = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MemberModel>>,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberModelCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $MemberModelCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemberStateImplCopyWith<$Res>
    implements $MemberStateCopyWith<$Res> {
  factory _$$MemberStateImplCopyWith(
          _$MemberStateImpl value, $Res Function(_$MemberStateImpl) then) =
      __$$MemberStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      AsyncValue<List<MemberModel>> members,
      MemberModel? member,
      String? errorMsg,
      int? statusCode});

  @override
  $MemberModelCopyWith<$Res>? get member;
}

/// @nodoc
class __$$MemberStateImplCopyWithImpl<$Res>
    extends _$MemberStateCopyWithImpl<$Res, _$MemberStateImpl>
    implements _$$MemberStateImplCopyWith<$Res> {
  __$$MemberStateImplCopyWithImpl(
      _$MemberStateImpl _value, $Res Function(_$MemberStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? members = null,
    Object? member = freezed,
    Object? errorMsg = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$MemberStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MemberModel>>,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as MemberModel?,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$MemberStateImpl implements _MemberState {
  _$MemberStateImpl(
      {this.isLoading = false,
      this.members = const AsyncValue.loading(),
      this.member,
      this.errorMsg,
      this.statusCode});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final AsyncValue<List<MemberModel>> members;
  @override
  final MemberModel? member;
  @override
  final String? errorMsg;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'MemberState(isLoading: $isLoading, members: $members, member: $member, errorMsg: $errorMsg, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.members, members) || other.members == members) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, members, member, errorMsg, statusCode);

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberStateImplCopyWith<_$MemberStateImpl> get copyWith =>
      __$$MemberStateImplCopyWithImpl<_$MemberStateImpl>(this, _$identity);
}

abstract class _MemberState implements MemberState {
  factory _MemberState(
      {final bool isLoading,
      final AsyncValue<List<MemberModel>> members,
      final MemberModel? member,
      final String? errorMsg,
      final int? statusCode}) = _$MemberStateImpl;

  @override
  bool get isLoading;
  @override
  AsyncValue<List<MemberModel>> get members;
  @override
  MemberModel? get member;
  @override
  String? get errorMsg;
  @override
  int? get statusCode;

  /// Create a copy of MemberState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberStateImplCopyWith<_$MemberStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
