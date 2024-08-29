import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:setting/data/dto/church_setting_response.dart';
import 'package:riverpod/riverpod.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

part 'setting_api.g.dart';

final settingApiProvider = Provider<SettingApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return SettingApi(dio);
});

@RestApi(parser: Parser.FlutterCompute)
abstract class SettingApi {
  factory SettingApi(Dio dio) => _SettingApi(dio);

  @GET('api/v1/church-setting')
  Future<ChurchSettingResponse> findById();
}
