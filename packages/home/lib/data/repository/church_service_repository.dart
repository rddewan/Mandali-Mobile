import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:core/local/db/entity/setting_entity.dart';
import 'package:core/local/db/entity/user_entity.dart';
import 'package:core/local/db/isar_db.dart';
import 'package:home/data/api/church_service_api.dart';
import 'package:home/data/dto/church_service_response.dart';
import 'package:home/data/repository/ichurch_service_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final churchServiceRepositoryProvider =
    Provider.autoDispose<IChurchServiceRepository>((ref) {
  final churchServiceApi = ref.watch(churchServiceApiProvider);
  final isarDb = ref.watch(isarDbProvider);

  return ChurchServiceRepository(churchServiceApi, isarDb);
});

final class ChurchServiceRepository implements IChurchServiceRepository {
  final ChurchServiceApi _churchServiceApi;
  final IsarDb _isarDb;

  ChurchServiceRepository(this._churchServiceApi, this._isarDb);

  @override
  Future<ChurchServiceResponse> createChurchService(
    Map<String, dynamic> body,
  ) async {
    try {
      return await _churchServiceApi.createChurchService(body);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }
      if (e.error is JsonUnsupportedObjectError) {
        throw Failure(
          message: 'Unsupported object, please check your input',
        );
      }
      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          statusCode: e.response?.statusCode,
        );
      }

      throw Failure(
        message:
            e.response?.data['message'].toString() ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
        exception: e,
      );
    }
  }

  @override
  Future<ChurchServiceResponse> deleteChurchService(String id) async {
    try {
      return await _churchServiceApi.deleteChurchService(id);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }
      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          statusCode: e.response?.statusCode,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
        exception: e,
      );
    }
  }

  @override
  Future<ChurchServiceResponse> getChurchService(String id) async {
    try {
      return await _churchServiceApi.getChurchService(id);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }
      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          statusCode: e.response?.statusCode,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
        exception: e,
      );
    }
  }

  @override
  Future<ChurchServicesResponse> getChurchServices(
    Map<String, dynamic> queries,
  ) async {
    try {
      return await _churchServiceApi.getChurchServices(queries);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }
      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          statusCode: e.response?.statusCode,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
        exception: e,
      );
    }
  }

  @override
  Future<ChurchServiceResponse> updateChurchService(
    Map<String, dynamic> body,
  ) async {
    try {
      return await _churchServiceApi.updateChurchService(body);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }
      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          statusCode: e.response?.statusCode,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
        exception: e,
      );
    }
  }

  @override
  Future<UserEntity?> readUser() async {
    try {
      return await _isarDb.readUser();
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<SettingEntity?> readSetting() async {
    try {
      return await _isarDb.readSetting();
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }
}
