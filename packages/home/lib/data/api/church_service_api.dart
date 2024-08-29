import 'package:core/core.dart';
import 'package:home/data/dto/church_service_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'church_service_api.g.dart';

final churchServiceApiProvider = Provider.autoDispose<ChurchServiceApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return ChurchServiceApi(dio);
});

@RestApi()
abstract class ChurchServiceApi {
  factory ChurchServiceApi(Dio dio) => _ChurchServiceApi(dio);

  @GET('/api/v1/church-service')
  Future<ChurchServicesResponse> getChurchServices(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/api/v1/church-service/{id}')
  Future<ChurchServiceResponse> getChurchService(@Path() String id);

  @POST('/api/v1/church-service')
  Future<ChurchServiceResponse> createChurchService(
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/api/v1/church-service')
  Future<ChurchServiceResponse> updateChurchService(
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/api/v1/church-service/{id}')
  Future<ChurchServiceResponse> deleteChurchService(@Path() String id);
}
