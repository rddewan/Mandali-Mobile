// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'church_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChurchState {
  AsyncValue<List<ChurchModel>> get churchList =>
      throw _privateConstructorUsedError;
  ChurchModel? get selectedChurch => throw _privateConstructorUsedError;

  /// Create a copy of ChurchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChurchStateCopyWith<ChurchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChurchStateCopyWith<$Res> {
  factory $ChurchStateCopyWith(
          ChurchState value, $Res Function(ChurchState) then) =
      _$ChurchStateCopyWithImpl<$Res, ChurchState>;
  @useResult
  $Res call(
      {AsyncValue<List<ChurchModel>> churchList, ChurchModel? selectedChurch});

  $ChurchModelCopyWith<$Res>? get selectedChurch;
}

/// @nodoc
class _$ChurchStateCopyWithImpl<$Res, $Val extends ChurchState>
    implements $ChurchStateCopyWith<$Res> {
  _$ChurchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChurchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? churchList = null,
    Object? selectedChurch = freezed,
  }) {
    return _then(_value.copyWith(
      churchList: null == churchList
          ? _value.churchList
          : churchList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ChurchModel>>,
      selectedChurch: freezed == selectedChurch
          ? _value.selectedChurch
          : selectedChurch // ignore: cast_nullable_to_non_nullable
              as ChurchModel?,
    ) as $Val);
  }

  /// Create a copy of ChurchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChurchModelCopyWith<$Res>? get selectedChurch {
    if (_value.selectedChurch == null) {
      return null;
    }

    return $ChurchModelCopyWith<$Res>(_value.selectedChurch!, (value) {
      return _then(_value.copyWith(selectedChurch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChurchStateImplCopyWith<$Res>
    implements $ChurchStateCopyWith<$Res> {
  factory _$$ChurchStateImplCopyWith(
          _$ChurchStateImpl value, $Res Function(_$ChurchStateImpl) then) =
      __$$ChurchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<ChurchModel>> churchList, ChurchModel? selectedChurch});

  @override
  $ChurchModelCopyWith<$Res>? get selectedChurch;
}

/// @nodoc
class __$$ChurchStateImplCopyWithImpl<$Res>
    extends _$ChurchStateCopyWithImpl<$Res, _$ChurchStateImpl>
    implements _$$ChurchStateImplCopyWith<$Res> {
  __$$ChurchStateImplCopyWithImpl(
      _$ChurchStateImpl _value, $Res Function(_$ChurchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChurchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? churchList = null,
    Object? selectedChurch = freezed,
  }) {
    return _then(_$ChurchStateImpl(
      churchList: null == churchList
          ? _value.churchList
          : churchList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ChurchModel>>,
      selectedChurch: freezed == selectedChurch
          ? _value.selectedChurch
          : selectedChurch // ignore: cast_nullable_to_non_nullable
              as ChurchModel?,
    ));
  }
}

/// @nodoc

class _$ChurchStateImpl implements _ChurchState {
  _$ChurchStateImpl(
      {this.churchList = const AsyncLoading(), this.selectedChurch});

  @override
  @JsonKey()
  final AsyncValue<List<ChurchModel>> churchList;
  @override
  final ChurchModel? selectedChurch;

  @override
  String toString() {
    return 'ChurchState(churchList: $churchList, selectedChurch: $selectedChurch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChurchStateImpl &&
            (identical(other.churchList, churchList) ||
                other.churchList == churchList) &&
            (identical(other.selectedChurch, selectedChurch) ||
                other.selectedChurch == selectedChurch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, churchList, selectedChurch);

  /// Create a copy of ChurchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChurchStateImplCopyWith<_$ChurchStateImpl> get copyWith =>
      __$$ChurchStateImplCopyWithImpl<_$ChurchStateImpl>(this, _$identity);
}

abstract class _ChurchState implements ChurchState {
  factory _ChurchState(
      {final AsyncValue<List<ChurchModel>> churchList,
      final ChurchModel? selectedChurch}) = _$ChurchStateImpl;

  @override
  AsyncValue<List<ChurchModel>> get churchList;
  @override
  ChurchModel? get selectedChurch;

  /// Create a copy of ChurchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChurchStateImplCopyWith<_$ChurchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
