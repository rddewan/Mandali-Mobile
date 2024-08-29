import 'package:church/data/dto/church_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';

part 'church_api.g.dart';

final churchApiProvider = Provider<ChurchApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return ChurchApi(dio);
});

@RestApi()
abstract class ChurchApi {
  factory ChurchApi(Dio dio) => _ChurchApi(dio);

  @GET('/api/v1/church')
  Future<ChurchListResponse> findAll();
}
