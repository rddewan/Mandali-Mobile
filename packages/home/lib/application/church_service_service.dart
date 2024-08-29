import 'dart:isolate';

import 'package:common/common.dart';
import 'package:core/local/db/entity/setting_entity.dart';
import 'package:core/local/db/entity/user_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:home/application/ichurch_service_service.dart';
import 'package:home/data/dto/church_service_response.dart';
import 'package:home/data/repository/church_service_repository.dart';
import 'package:home/data/repository/ichurch_service_repository.dart';
import 'package:home/domain/church_service_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final churchServiceServiceProvider =
    Provider.autoDispose<IchurchServiceService>((ref) {
  final churchServiceRepository = ref.watch(churchServiceRepositoryProvider);

  return ChurchServiceService(churchServiceRepository);
});

final class ChurchServiceService implements IchurchServiceService {
  final IChurchServiceRepository _churchServiceRepository;

  const ChurchServiceService(this._churchServiceRepository);

  @override
  Future<Result<ChurchService, Failure>> createChurchService(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _churchServiceRepository.createChurchService(body);
      final result = await Isolate.run(() => _mapToChurchService(response));

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<ChurchService, Failure>> deleteChurchService(
    String id,
  ) async {
    try {
      final response = await _churchServiceRepository.deleteChurchService(id);
      final result = await Isolate.run(() => _mapToChurchService(response));

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<ChurchService, Failure>> getChurchService(
    String id,
  ) async {
    try {
      final response = await _churchServiceRepository.getChurchService(id);
      final result = await Isolate.run(() => _mapToChurchService(response));

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<ChurchServiceModel, Failure>> getChurchServices(
    Map<String, dynamic> queries,
  ) async {
    try {
      final response =
          await _churchServiceRepository.getChurchServices(queries);

      final result = await compute(_mapToChurchServiceModel, response);

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<ChurchService, Failure>> updateChurchService(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _churchServiceRepository.updateChurchService(body);

      final result = await Isolate.run(() => _mapToChurchService(response));

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<UserEntity?, Failure>> readUser() async {
    try {
      final result = await _churchServiceRepository.readUser();

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<SettingEntity?, Failure>> readSetting() async {
    try {
      final result = await _churchServiceRepository.readSetting();

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }
}

String _dateToString(DateTime date) {
  final formate = DateFormat('dd MMM yyyy h:mm a');
  return formate.format(date);
}

ChurchService _mapToChurchService(ChurchServiceResponse response) {
  final data = response.data;
  return ChurchService(
    id: data?.id,
    date: _dateToString(data?.date ?? DateTime.now()),
    chairPerson: data?.chairPerson,
    preacher: data?.preacher,
    bibleReaders: data?.bibleReaders ?? [],
    offering: data?.offering,
    worship: data?.worship,
    serviceType: data?.serviceType,
    createdBy: data?.createdBy,
  );
}

ChurchServiceModel _mapToChurchServiceModel(ChurchServicesResponse response) {
  final data = response.data;
  final page = response.page;
  final churchServices = data
      .map(
        (e) => ChurchService(
          id: e.id,
          date: _dateToString(e.date),
          chairPerson: e.chairPerson,
          preacher: e.preacher,
          bibleReaders: e.bibleReaders,
          offering: e.offering,
          worship: e.worship,
          serviceType: e.serviceType,
          createdBy: e.createdBy,
        ),
      )
      .toList();

  return ChurchServiceModel(
    churchServices: churchServices,
    page: Page(
      currentPage: page.currentPage,
      total: page.total,
      totalPage: page.totalPage,
    ),
  );
}
