import 'dart:io';
import 'dart:isolate';

import 'package:church/data/api/church_api.dart';
import 'package:church/data/dto/church_list_response.dart';
import 'package:church/data/repository/ichurch_repository.dart';
import 'package:church/domain/church_model.dart';
import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:core/local/db/entity/church_entity.dart';
import 'package:core/local/db/isar_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final churchRepositoryProvider = Provider<IChurchRepository>((ref) {
  final churchApi = ref.watch(churchApiProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  final isarDb = ref.watch(isarDbProvider);

  return ChurchRepository(churchApi, secureStorage, isarDb);
});

final class ChurchRepository implements IChurchRepository {
  final ChurchApi _churchApi;
  final ISecureStorage _secureStorage;
  final IsarDb _isarDb;

  ChurchRepository(this._churchApi, this._secureStorage, this._isarDb);

  @override
  Future<List<ChurchModel>> findAll() async {
    try {
      List<ChurchEntity> churches = [];

      churches = await _isarDb.readChurchs();

      if (churches.isNotEmpty) {
        // map to church model
        final result = await Isolate.run(() => _mapToChurchModel(churches));
        return result;
      }

      // read churchs from api
      final response = await _churchApi.findAll();
      // map to churchs
      churches = await Isolate.run(() => _mapToChurch(response.data));
      // write churchs to local db
      await writeChurchs(churches);
      // read churchs from local db
      churches = await readChurchs();
      // map to church model
      final result = await Isolate.run(() => _mapToChurchModel(churches));

      return result;
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
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<void> writeChurchs(List<ChurchEntity> churches) async {
    try {
      await _isarDb.writeChurchs(churches);
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<List<ChurchEntity>> readChurchs() async {
    try {
      return await _isarDb.readChurchs();
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<void> writeToSecureStorage(String key, String? value) async {
    try {
      await _secureStorage.write(key, value);
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }
}

List<ChurchEntity> _mapToChurch(List<ChurchResponse> data) {
  final result = data
      .map(
        (e) => ChurchEntity()
          ..id = e.id
          ..name = e.name
          ..address = e.address,
      )
      .toList();

  return result;
}

List<ChurchModel> _mapToChurchModel(List<ChurchEntity> data) {
  final result = data
      .map(
        (e) => ChurchModel(
          id: e.id ?? 0,
          name: e.name ?? '',
          address: e.address ?? '',
        ),
      )
      .toList();

  return result;
}
