import 'package:common/common.dart';
import 'package:common/enum/church_service_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home/application/church_service_service.dart';
import 'package:home/presentation/state/home_state.dart';
import 'package:timezone/timezone.dart' as tz;

final homeControllerProvider =
    AutoDisposeNotifierProvider<HomeController, HomeState>(HomeController.new);

class HomeController extends AutoDisposeNotifier<HomeState> {
  @override
  HomeState build() {
    return HomeState();
  }

  Future<void> getUser() async {
    final service = ref.read(churchServiceServiceProvider);
    state = state.copyWith(errorMsg: null);

    final result = await service.readUser();
    result.when((success) {
      state = state.copyWith(user: success);
    }, (error) {
      state = state.copyWith(errorMsg: error.message);
    });
  }

  Future<void> getSetting() async {
    final service = ref.read(churchServiceServiceProvider);
    state = state.copyWith(errorMsg: null);

    final result = await service.readSetting();
    result.when((success) {
      state = state.copyWith(setting: success);
      // set the time zone
      ref.read(timeZoneProvider.notifier).state = success?.timeZone ?? '';
    }, (error) {
      state = state.copyWith(errorMsg: error.message);
    });
  }

  Future<void> getChurchServices() async {
    final service = ref.read(churchServiceServiceProvider);
    // get the old church services
    final oldServices = state.churchServices;
    // if there is a old data and the user is not scrolling then just return
    if (oldServices.isNotEmpty && !state.isScrolling) return;
    // if the user is fetching and loading then return
    if (state.isFetching && state.isChurchServiceLoading) return;

    if (oldServices.isNotEmpty) {
      state = state.copyWith(
        isFetching: true,
        statusCode: null,
        errorMsg: null,
      );
    } else {
      state = state.copyWith(
        isChurchServiceLoading: true,
        statusCode: null,
        errorMsg: null,
      );
    }
    // set the current page
    final currentPage = state.currentPage == 0 ? 1 : state.currentPage + 1;
    // set the querys
    final queries = <String, dynamic>{
      'page': currentPage,
      'limit': state.limit,
    };

    final result = await service.getChurchServices(queries);

    result.when((data) {
      state = state.copyWith(
        churchServices: [...oldServices, ...data.churchServices],
        currentPage: data.page.currentPage,
        totalPage: data.page.totalPage,
        total: data.page.total,
        isChurchServiceLoading: false,
        isFetching: false,
      );
    }, (error) {
      state = state.copyWith(
        isChurchServiceLoading: false,
        isFetching: false,
        statusCode: error.statusCode,
        errorMsg: error.message,
      );
    });
  }

  Future<void> getChurchService(String id) async {
    // if id is the same, do nothing
    if (state.churchService?.id == int.parse(id)) return;

    state = state.copyWith(
      isFetchingDetail: true,
      errorMsg: null,
      statusCode: null,
    );

    final service = ref.read(churchServiceServiceProvider);
    final result = await service.getChurchService(id);
    return result.when(
      (success) {
        state = state.copyWith(
          churchService: success,
          isFetchingDetail: false,
        );
      },
      (error) {
        state = state.copyWith(
          errorMsg: error.message,
          statusCode: error.statusCode,
          isFetchingDetail: false,
        );
      },
    );
  }

  Future<void> createChurchService() async {
    final service = ref.read(churchServiceServiceProvider);

    state = state.copyWith(
      isLoading: true,
      statusCode: null,
      errorMsg: null,
      isCreated: null,
    );
    final serviceType = state.formData['serviceType'] as ChurchServiceType;

    final body = {
      'date': state.formData['date'],
      'chairPerson': state.formData['chairPerson'],
      'preacher': state.formData['preacher'],
      'bibleReaders': state.bibleReaders,
      'offering': state.formData['offering'],
      'worship': state.formData['worship'],
      'serviceType': serviceType.name,
      'createdBy': state.user?.id,
      'churchId': state.user?.church?.id,
    };

    final result = await service.createChurchService(body);

    result.when((data) {
      state = state.copyWith(
        formData: {},
        bibleReaders: [],
        isLoading: false,
        isCreated: true,
      );
    }, (error) {
      state = state.copyWith(
        isLoading: false,
        errorMsg: error.message,
      );
    });
  }

  Future<void> updateChurchService() async {
    final service = ref.read(churchServiceServiceProvider);

    state = state.copyWith(
      isUpdating: true,
      isUpdated: null,
      statusCode: null,
      errorMsg: null,
    );
    final serviceType =
        state.updateFormState['serviceType'] as ChurchServiceType;

    final body = {
      'id': state.updateFormState['id'],
      'date': state.updateFormState['date'],
      'chairPerson': state.updateFormState['chairPerson'],
      'preacher': state.updateFormState['preacher'],
      'bibleReaders': state.updateBibleReaders,
      'offering': state.updateFormState['offering'],
      'worship': state.updateFormState['worship'],
      'serviceType': serviceType.name,
      'createdBy': state.user?.id,
      'churchId': state.user?.church?.id,
    };

    final result = await service.updateChurchService(body);

    result.when((data) {
      state = state.copyWith(
        updateFormState: {},
        updateBibleReaders: [],
        isUpdating: false,
        isUpdated: true,
      );
    }, (error) {
      state = state.copyWith(
        isUpdating: false,
        errorMsg: error.message,
      );
    });
  }

  Future<bool> deleteChurchService(String id) async {
    state = state.copyWith(isDeleting: true, errorMsg: null, statusCode: null);

    final service = ref.read(churchServiceServiceProvider);
    final result = await service.deleteChurchService(id);
    return result.when(
      (success) {
        state = state.copyWith(isDeleting: false);
        return true;
      },
      (error) {
        state = state.copyWith(
          isDeleting: false,
          errorMsg: error.message,
          statusCode: error.statusCode,
        );
        return false;
      },
    );
  }

  void setSelectedChurchService(int id) {
    const String timeZone = 'Asia/Kolkata';
    final location = tz.getLocation(timeZone);
    final churchServices = state.churchServices;
    final selectedChurchService = churchServices.firstWhere((e) => e.id == id);

    state = state.copyWith(
      selectedChurchService: selectedChurchService,
    );

    final dateFormat = ref.read(uiDateTimeProvider);
    DateTime dateTime = dateFormat.parse(
      selectedChurchService.date ?? DateTime.now().toString(),
    );
    // time zone
    final tZDateTime = tz.TZDateTime.from(dateTime, location);
    // date format
    var formatter = ref.read(apiDateTimeProvider);
    String formatted = formatter.format(tZDateTime);

    setUpdateFormState(
      "id",
      selectedChurchService.id,
    );

    setUpdateFormState(
      "date",
      formatted,
    );
    setUpdateFormState(
      "chairPerson",
      selectedChurchService.chairPerson,
    );
    setUpdateFormState(
      "preacher",
      selectedChurchService.preacher,
    );
    setUpdateFormState(
      "offering",
      selectedChurchService.offering,
    );
    setUpdateFormState(
      "worship",
      selectedChurchService.worship,
    );
    setUpdateFormState(
      "serviceType",
      selectedChurchService.serviceType,
    );
    setUpdateFormState(
      "chairPerson",
      selectedChurchService.chairPerson,
    );

    for (var bibleReader in selectedChurchService.bibleReaders) {
      setUpdateBibleReader(bibleReader);
    }
  }

  void setUpdateFormState(String key, dynamic value) {
    state = state.copyWith(
      updateFormState: {
        ...state.updateFormState,
        ...{key: value},
      },
    );
  }

  void setFormState(String key, dynamic value) {
    state = state.copyWith(
      formData: {
        ...state.formData,
        ...{key: value},
      },
    );
  }

  void setBibleReader(String bibleReader) {
    state = state.copyWith(
      bibleReaders: [...state.bibleReaders, bibleReader],
    );
  }

  void setUpdateBibleReader(String bibleReader) {
    state = state.copyWith(
      updateBibleReaders: [...state.updateBibleReaders, bibleReader],
    );
  }

  void removeBibleReader(int index) {
    final readers = [...state.bibleReaders];
    readers.removeAt(index);
    state = state.copyWith(
      bibleReaders: readers,
    );
  }

  void removeUpdateBibleReader(int index) {
    final readers = [...state.updateBibleReaders];
    readers.removeAt(index);
    state = state.copyWith(
      updateBibleReaders: readers,
    );
  }

  String getServiceType() {
    return state.formData['serviceType'] as String;
  }

  /// set is scrolling value @param[bool]
  void setIsScrolling(bool value) {
    state = state.copyWith(isScrolling: value);
  }

  Future<void> onRefresh() async {
    state = state.copyWith(
      churchServices: [],
      isScrolling: false,
      isLoading: false,
      isFetching: false,
      isCreated: null,
      statusCode: null,
      errorMsg: null,
      currentPage: 0,
    );
  }
}
