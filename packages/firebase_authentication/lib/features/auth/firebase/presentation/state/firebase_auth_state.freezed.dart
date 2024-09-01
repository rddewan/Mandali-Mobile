// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FirebaseAuthState {
  String get countryCode => throw _privateConstructorUsedError;
  String get selectedCountryCode => throw _privateConstructorUsedError;
  CountryCodeItem? get item => throw _privateConstructorUsedError;
  List<CountryCodeItem> get countries => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  int? get resendToken => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;
  String? get otpErrorMsg => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  bool get isDisplayNameSet => throw _privateConstructorUsedError;
  bool get isSignOut => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUserDeleted => throw _privateConstructorUsedError;
  bool get needToSignIn => throw _privateConstructorUsedError;
  String get smsCode => throw _privateConstructorUsedError;

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirebaseAuthStateCopyWith<FirebaseAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseAuthStateCopyWith<$Res> {
  factory $FirebaseAuthStateCopyWith(
          FirebaseAuthState value, $Res Function(FirebaseAuthState) then) =
      _$FirebaseAuthStateCopyWithImpl<$Res, FirebaseAuthState>;
  @useResult
  $Res call(
      {String countryCode,
      String selectedCountryCode,
      CountryCodeItem? item,
      List<CountryCodeItem> countries,
      String? verificationId,
      String? phoneNumber,
      int? resendToken,
      String? errorMsg,
      String? otpErrorMsg,
      String? userId,
      bool isDisplayNameSet,
      bool isSignOut,
      bool isLoading,
      bool isUserDeleted,
      bool needToSignIn,
      String smsCode});
}

/// @nodoc
class _$FirebaseAuthStateCopyWithImpl<$Res, $Val extends FirebaseAuthState>
    implements $FirebaseAuthStateCopyWith<$Res> {
  _$FirebaseAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
    Object? selectedCountryCode = null,
    Object? item = freezed,
    Object? countries = null,
    Object? verificationId = freezed,
    Object? phoneNumber = freezed,
    Object? resendToken = freezed,
    Object? errorMsg = freezed,
    Object? otpErrorMsg = freezed,
    Object? userId = freezed,
    Object? isDisplayNameSet = null,
    Object? isSignOut = null,
    Object? isLoading = null,
    Object? isUserDeleted = null,
    Object? needToSignIn = null,
    Object? smsCode = null,
  }) {
    return _then(_value.copyWith(
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCountryCode: null == selectedCountryCode
          ? _value.selectedCountryCode
          : selectedCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CountryCodeItem?,
      countries: null == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryCodeItem>,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      resendToken: freezed == resendToken
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      otpErrorMsg: freezed == otpErrorMsg
          ? _value.otpErrorMsg
          : otpErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDisplayNameSet: null == isDisplayNameSet
          ? _value.isDisplayNameSet
          : isDisplayNameSet // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignOut: null == isSignOut
          ? _value.isSignOut
          : isSignOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserDeleted: null == isUserDeleted
          ? _value.isUserDeleted
          : isUserDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      needToSignIn: null == needToSignIn
          ? _value.needToSignIn
          : needToSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
      smsCode: null == smsCode
          ? _value.smsCode
          : smsCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirebaseAuthStateImplCopyWith<$Res>
    implements $FirebaseAuthStateCopyWith<$Res> {
  factory _$$FirebaseAuthStateImplCopyWith(_$FirebaseAuthStateImpl value,
          $Res Function(_$FirebaseAuthStateImpl) then) =
      __$$FirebaseAuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String countryCode,
      String selectedCountryCode,
      CountryCodeItem? item,
      List<CountryCodeItem> countries,
      String? verificationId,
      String? phoneNumber,
      int? resendToken,
      String? errorMsg,
      String? otpErrorMsg,
      String? userId,
      bool isDisplayNameSet,
      bool isSignOut,
      bool isLoading,
      bool isUserDeleted,
      bool needToSignIn,
      String smsCode});
}

/// @nodoc
class __$$FirebaseAuthStateImplCopyWithImpl<$Res>
    extends _$FirebaseAuthStateCopyWithImpl<$Res, _$FirebaseAuthStateImpl>
    implements _$$FirebaseAuthStateImplCopyWith<$Res> {
  __$$FirebaseAuthStateImplCopyWithImpl(_$FirebaseAuthStateImpl _value,
      $Res Function(_$FirebaseAuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
    Object? selectedCountryCode = null,
    Object? item = freezed,
    Object? countries = null,
    Object? verificationId = freezed,
    Object? phoneNumber = freezed,
    Object? resendToken = freezed,
    Object? errorMsg = freezed,
    Object? otpErrorMsg = freezed,
    Object? userId = freezed,
    Object? isDisplayNameSet = null,
    Object? isSignOut = null,
    Object? isLoading = null,
    Object? isUserDeleted = null,
    Object? needToSignIn = null,
    Object? smsCode = null,
  }) {
    return _then(_$FirebaseAuthStateImpl(
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCountryCode: null == selectedCountryCode
          ? _value.selectedCountryCode
          : selectedCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CountryCodeItem?,
      countries: null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryCodeItem>,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      resendToken: freezed == resendToken
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      otpErrorMsg: freezed == otpErrorMsg
          ? _value.otpErrorMsg
          : otpErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDisplayNameSet: null == isDisplayNameSet
          ? _value.isDisplayNameSet
          : isDisplayNameSet // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignOut: null == isSignOut
          ? _value.isSignOut
          : isSignOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserDeleted: null == isUserDeleted
          ? _value.isUserDeleted
          : isUserDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      needToSignIn: null == needToSignIn
          ? _value.needToSignIn
          : needToSignIn // ignore: cast_nullable_to_non_nullable
              as bool,
      smsCode: null == smsCode
          ? _value.smsCode
          : smsCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirebaseAuthStateImpl implements _FirebaseAuthState {
  const _$FirebaseAuthStateImpl(
      {this.countryCode = '',
      this.selectedCountryCode = '',
      this.item,
      final List<CountryCodeItem> countries = const [],
      this.verificationId,
      this.phoneNumber,
      this.resendToken,
      this.errorMsg,
      this.otpErrorMsg,
      this.userId,
      this.isDisplayNameSet = false,
      this.isSignOut = false,
      this.isLoading = false,
      this.isUserDeleted = false,
      this.needToSignIn = false,
      this.smsCode = ''})
      : _countries = countries;

  @override
  @JsonKey()
  final String countryCode;
  @override
  @JsonKey()
  final String selectedCountryCode;
  @override
  final CountryCodeItem? item;
  final List<CountryCodeItem> _countries;
  @override
  @JsonKey()
  List<CountryCodeItem> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  @override
  final String? verificationId;
  @override
  final String? phoneNumber;
  @override
  final int? resendToken;
  @override
  final String? errorMsg;
  @override
  final String? otpErrorMsg;
  @override
  final String? userId;
  @override
  @JsonKey()
  final bool isDisplayNameSet;
  @override
  @JsonKey()
  final bool isSignOut;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUserDeleted;
  @override
  @JsonKey()
  final bool needToSignIn;
  @override
  @JsonKey()
  final String smsCode;

  @override
  String toString() {
    return 'FirebaseAuthState(countryCode: $countryCode, selectedCountryCode: $selectedCountryCode, item: $item, countries: $countries, verificationId: $verificationId, phoneNumber: $phoneNumber, resendToken: $resendToken, errorMsg: $errorMsg, otpErrorMsg: $otpErrorMsg, userId: $userId, isDisplayNameSet: $isDisplayNameSet, isSignOut: $isSignOut, isLoading: $isLoading, isUserDeleted: $isUserDeleted, needToSignIn: $needToSignIn, smsCode: $smsCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseAuthStateImpl &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.selectedCountryCode, selectedCountryCode) ||
                other.selectedCountryCode == selectedCountryCode) &&
            (identical(other.item, item) || other.item == item) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.resendToken, resendToken) ||
                other.resendToken == resendToken) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.otpErrorMsg, otpErrorMsg) ||
                other.otpErrorMsg == otpErrorMsg) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isDisplayNameSet, isDisplayNameSet) ||
                other.isDisplayNameSet == isDisplayNameSet) &&
            (identical(other.isSignOut, isSignOut) ||
                other.isSignOut == isSignOut) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUserDeleted, isUserDeleted) ||
                other.isUserDeleted == isUserDeleted) &&
            (identical(other.needToSignIn, needToSignIn) ||
                other.needToSignIn == needToSignIn) &&
            (identical(other.smsCode, smsCode) || other.smsCode == smsCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      countryCode,
      selectedCountryCode,
      item,
      const DeepCollectionEquality().hash(_countries),
      verificationId,
      phoneNumber,
      resendToken,
      errorMsg,
      otpErrorMsg,
      userId,
      isDisplayNameSet,
      isSignOut,
      isLoading,
      isUserDeleted,
      needToSignIn,
      smsCode);

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseAuthStateImplCopyWith<_$FirebaseAuthStateImpl> get copyWith =>
      __$$FirebaseAuthStateImplCopyWithImpl<_$FirebaseAuthStateImpl>(
          this, _$identity);
}

abstract class _FirebaseAuthState implements FirebaseAuthState {
  const factory _FirebaseAuthState(
      {final String countryCode,
      final String selectedCountryCode,
      final CountryCodeItem? item,
      final List<CountryCodeItem> countries,
      final String? verificationId,
      final String? phoneNumber,
      final int? resendToken,
      final String? errorMsg,
      final String? otpErrorMsg,
      final String? userId,
      final bool isDisplayNameSet,
      final bool isSignOut,
      final bool isLoading,
      final bool isUserDeleted,
      final bool needToSignIn,
      final String smsCode}) = _$FirebaseAuthStateImpl;

  @override
  String get countryCode;
  @override
  String get selectedCountryCode;
  @override
  CountryCodeItem? get item;
  @override
  List<CountryCodeItem> get countries;
  @override
  String? get verificationId;
  @override
  String? get phoneNumber;
  @override
  int? get resendToken;
  @override
  String? get errorMsg;
  @override
  String? get otpErrorMsg;
  @override
  String? get userId;
  @override
  bool get isDisplayNameSet;
  @override
  bool get isSignOut;
  @override
  bool get isLoading;
  @override
  bool get isUserDeleted;
  @override
  bool get needToSignIn;
  @override
  String get smsCode;

  /// Create a copy of FirebaseAuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseAuthStateImplCopyWith<_$FirebaseAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
