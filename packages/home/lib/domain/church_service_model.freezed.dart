// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'church_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChurchServiceModel {
  List<ChurchService> get churchServices => throw _privateConstructorUsedError;
  Page get page => throw _privateConstructorUsedError;

  /// Create a copy of ChurchServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChurchServiceModelCopyWith<ChurchServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChurchServiceModelCopyWith<$Res> {
  factory $ChurchServiceModelCopyWith(
          ChurchServiceModel value, $Res Function(ChurchServiceModel) then) =
      _$ChurchServiceModelCopyWithImpl<$Res, ChurchServiceModel>;
  @useResult
  $Res call({List<ChurchService> churchServices, Page page});

  $PageCopyWith<$Res> get page;
}

/// @nodoc
class _$ChurchServiceModelCopyWithImpl<$Res, $Val extends ChurchServiceModel>
    implements $ChurchServiceModelCopyWith<$Res> {
  _$ChurchServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChurchServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? churchServices = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      churchServices: null == churchServices
          ? _value.churchServices
          : churchServices // ignore: cast_nullable_to_non_nullable
              as List<ChurchService>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page,
    ) as $Val);
  }

  /// Create a copy of ChurchServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageCopyWith<$Res> get page {
    return $PageCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChurchServiceModelImplCopyWith<$Res>
    implements $ChurchServiceModelCopyWith<$Res> {
  factory _$$ChurchServiceModelImplCopyWith(_$ChurchServiceModelImpl value,
          $Res Function(_$ChurchServiceModelImpl) then) =
      __$$ChurchServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChurchService> churchServices, Page page});

  @override
  $PageCopyWith<$Res> get page;
}

/// @nodoc
class __$$ChurchServiceModelImplCopyWithImpl<$Res>
    extends _$ChurchServiceModelCopyWithImpl<$Res, _$ChurchServiceModelImpl>
    implements _$$ChurchServiceModelImplCopyWith<$Res> {
  __$$ChurchServiceModelImplCopyWithImpl(_$ChurchServiceModelImpl _value,
      $Res Function(_$ChurchServiceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChurchServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? churchServices = null,
    Object? page = null,
  }) {
    return _then(_$ChurchServiceModelImpl(
      churchServices: null == churchServices
          ? _value._churchServices
          : churchServices // ignore: cast_nullable_to_non_nullable
              as List<ChurchService>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page,
    ));
  }
}

/// @nodoc

class _$ChurchServiceModelImpl implements _ChurchServiceModel {
  const _$ChurchServiceModelImpl(
      {final List<ChurchService> churchServices = const [],
      this.page = const Page()})
      : _churchServices = churchServices;

  final List<ChurchService> _churchServices;
  @override
  @JsonKey()
  List<ChurchService> get churchServices {
    if (_churchServices is EqualUnmodifiableListView) return _churchServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_churchServices);
  }

  @override
  @JsonKey()
  final Page page;

  @override
  String toString() {
    return 'ChurchServiceModel(churchServices: $churchServices, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChurchServiceModelImpl &&
            const DeepCollectionEquality()
                .equals(other._churchServices, _churchServices) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_churchServices), page);

  /// Create a copy of ChurchServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChurchServiceModelImplCopyWith<_$ChurchServiceModelImpl> get copyWith =>
      __$$ChurchServiceModelImplCopyWithImpl<_$ChurchServiceModelImpl>(
          this, _$identity);
}

abstract class _ChurchServiceModel implements ChurchServiceModel {
  const factory _ChurchServiceModel(
      {final List<ChurchService> churchServices,
      final Page page}) = _$ChurchServiceModelImpl;

  @override
  List<ChurchService> get churchServices;
  @override
  Page get page;

  /// Create a copy of ChurchServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChurchServiceModelImplCopyWith<_$ChurchServiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChurchService {
  int? get id => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get chairPerson => throw _privateConstructorUsedError;
  String? get preacher => throw _privateConstructorUsedError;
  List<String> get bibleReaders => throw _privateConstructorUsedError;
  String? get offering => throw _privateConstructorUsedError;
  String? get worship => throw _privateConstructorUsedError;
  ChurchServiceType? get serviceType => throw _privateConstructorUsedError;
  int? get createdBy => throw _privateConstructorUsedError;

  /// Create a copy of ChurchService
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChurchServiceCopyWith<ChurchService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChurchServiceCopyWith<$Res> {
  factory $ChurchServiceCopyWith(
          ChurchService value, $Res Function(ChurchService) then) =
      _$ChurchServiceCopyWithImpl<$Res, ChurchService>;
  @useResult
  $Res call(
      {int? id,
      String? date,
      String? chairPerson,
      String? preacher,
      List<String> bibleReaders,
      String? offering,
      String? worship,
      ChurchServiceType? serviceType,
      int? createdBy});
}

/// @nodoc
class _$ChurchServiceCopyWithImpl<$Res, $Val extends ChurchService>
    implements $ChurchServiceCopyWith<$Res> {
  _$ChurchServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChurchService
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? chairPerson = freezed,
    Object? preacher = freezed,
    Object? bibleReaders = null,
    Object? offering = freezed,
    Object? worship = freezed,
    Object? serviceType = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      chairPerson: freezed == chairPerson
          ? _value.chairPerson
          : chairPerson // ignore: cast_nullable_to_non_nullable
              as String?,
      preacher: freezed == preacher
          ? _value.preacher
          : preacher // ignore: cast_nullable_to_non_nullable
              as String?,
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
      serviceType: freezed == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ChurchServiceType?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChurchServiceImplCopyWith<$Res>
    implements $ChurchServiceCopyWith<$Res> {
  factory _$$ChurchServiceImplCopyWith(
          _$ChurchServiceImpl value, $Res Function(_$ChurchServiceImpl) then) =
      __$$ChurchServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? date,
      String? chairPerson,
      String? preacher,
      List<String> bibleReaders,
      String? offering,
      String? worship,
      ChurchServiceType? serviceType,
      int? createdBy});
}

/// @nodoc
class __$$ChurchServiceImplCopyWithImpl<$Res>
    extends _$ChurchServiceCopyWithImpl<$Res, _$ChurchServiceImpl>
    implements _$$ChurchServiceImplCopyWith<$Res> {
  __$$ChurchServiceImplCopyWithImpl(
      _$ChurchServiceImpl _value, $Res Function(_$ChurchServiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChurchService
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? chairPerson = freezed,
    Object? preacher = freezed,
    Object? bibleReaders = null,
    Object? offering = freezed,
    Object? worship = freezed,
    Object? serviceType = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_$ChurchServiceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      chairPerson: freezed == chairPerson
          ? _value.chairPerson
          : chairPerson // ignore: cast_nullable_to_non_nullable
              as String?,
      preacher: freezed == preacher
          ? _value.preacher
          : preacher // ignore: cast_nullable_to_non_nullable
              as String?,
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
      serviceType: freezed == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ChurchServiceType?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ChurchServiceImpl implements _ChurchService {
  const _$ChurchServiceImpl(
      {this.id,
      this.date,
      this.chairPerson,
      this.preacher,
      final List<String> bibleReaders = const [],
      this.offering,
      this.worship,
      this.serviceType,
      this.createdBy})
      : _bibleReaders = bibleReaders;

  @override
  final int? id;
  @override
  final String? date;
  @override
  final String? chairPerson;
  @override
  final String? preacher;
  final List<String> _bibleReaders;
  @override
  @JsonKey()
  List<String> get bibleReaders {
    if (_bibleReaders is EqualUnmodifiableListView) return _bibleReaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bibleReaders);
  }

  @override
  final String? offering;
  @override
  final String? worship;
  @override
  final ChurchServiceType? serviceType;
  @override
  final int? createdBy;

  @override
  String toString() {
    return 'ChurchService(id: $id, date: $date, chairPerson: $chairPerson, preacher: $preacher, bibleReaders: $bibleReaders, offering: $offering, worship: $worship, serviceType: $serviceType, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChurchServiceImpl &&
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
                other.createdBy == createdBy));
  }

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
      createdBy);

  /// Create a copy of ChurchService
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChurchServiceImplCopyWith<_$ChurchServiceImpl> get copyWith =>
      __$$ChurchServiceImplCopyWithImpl<_$ChurchServiceImpl>(this, _$identity);
}

abstract class _ChurchService implements ChurchService {
  const factory _ChurchService(
      {final int? id,
      final String? date,
      final String? chairPerson,
      final String? preacher,
      final List<String> bibleReaders,
      final String? offering,
      final String? worship,
      final ChurchServiceType? serviceType,
      final int? createdBy}) = _$ChurchServiceImpl;

  @override
  int? get id;
  @override
  String? get date;
  @override
  String? get chairPerson;
  @override
  String? get preacher;
  @override
  List<String> get bibleReaders;
  @override
  String? get offering;
  @override
  String? get worship;
  @override
  ChurchServiceType? get serviceType;
  @override
  int? get createdBy;

  /// Create a copy of ChurchService
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChurchServiceImplCopyWith<_$ChurchServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Page {
  int get currentPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get totalPage => throw _privateConstructorUsedError;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageCopyWith<Page> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageCopyWith<$Res> {
  factory $PageCopyWith(Page value, $Res Function(Page) then) =
      _$PageCopyWithImpl<$Res, Page>;
  @useResult
  $Res call({int currentPage, int total, int totalPage});
}

/// @nodoc
class _$PageCopyWithImpl<$Res, $Val extends Page>
    implements $PageCopyWith<$Res> {
  _$PageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Page
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
abstract class _$$PageImplCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$$PageImplCopyWith(
          _$PageImpl value, $Res Function(_$PageImpl) then) =
      __$$PageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, int total, int totalPage});
}

/// @nodoc
class __$$PageImplCopyWithImpl<$Res>
    extends _$PageCopyWithImpl<$Res, _$PageImpl>
    implements _$$PageImplCopyWith<$Res> {
  __$$PageImplCopyWithImpl(_$PageImpl _value, $Res Function(_$PageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? total = null,
    Object? totalPage = null,
  }) {
    return _then(_$PageImpl(
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

class _$PageImpl implements _Page {
  const _$PageImpl({this.currentPage = 1, this.total = 0, this.totalPage = 0});

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int totalPage;

  @override
  String toString() {
    return 'Page(currentPage: $currentPage, total: $total, totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPage, total, totalPage);

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageImplCopyWith<_$PageImpl> get copyWith =>
      __$$PageImplCopyWithImpl<_$PageImpl>(this, _$identity);
}

abstract class _Page implements Page {
  const factory _Page(
      {final int currentPage,
      final int total,
      final int totalPage}) = _$PageImpl;

  @override
  int get currentPage;
  @override
  int get total;
  @override
  int get totalPage;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageImplCopyWith<_$PageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
