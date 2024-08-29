import 'package:common/dto/login_response.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'login_with_firebase_token_api.g.dart';

final loginWithFirebaseTokenApiProvider =
    Provider.autoDispose<LoginWithFirebaseTokenApi>((ref) {
  final networkService = ref.watch(networkServiceProvider);

  return LoginWithFirebaseTokenApi(networkService);
});

@RestApi()
abstract class LoginWithFirebaseTokenApi {
  factory LoginWithFirebaseTokenApi(Dio dio) => _LoginWithFirebaseTokenApi(dio);

  @POST('/api/v1/auth/login-with-firebase-token')
  Future<LoginResponse> loginWithFirebaseToken(
    @Body() Map<String, dynamic> body,
  );
}
