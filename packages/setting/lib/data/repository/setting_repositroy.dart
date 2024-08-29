import 'dart:io';

import 'package:common/common.dart';
import 'package:core/local/db/entity/setting_entity.dart';
import 'package:core/local/db/isar_db.dart';
import 'package:setting/data/api/setting_api.dart';
import 'package:setting/data/repository/isetting_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final settingRepositoryProvider = Provider<ISettingRepository>((ref) {
  final isarDb = ref.watch(isarDbProvider);
  final settingApi = ref.watch(settingApiProvider);

  return SettingRepositroy(isarDb, settingApi);
});

final class SettingRepositroy implements ISettingRepository {
  final IsarDb _isarDb;
  final SettingApi _settingApi;

  SettingRepositroy(this._isarDb, this._settingApi);

  @override
  Future<SettingEntity> readSetting() async {
    try {
      return await _isarDb.readSetting();
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<void> writeSetting(SettingEntity setting) async {
    try {
      await _isarDb.writeSetting(setting);
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<void> getChurchSetting() async {
    try {
      final response = await _settingApi.findById();
      final settingEntity = SettingEntity()..timeZone = response.data.timeZone;

      writeSetting(settingEntity);
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
}
