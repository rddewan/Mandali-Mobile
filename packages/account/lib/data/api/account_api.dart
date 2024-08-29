import 'dart:io';

import 'package:account/data/dto/delete_me_response.dart';
import 'package:account/data/dto/me_response.dart';
import 'package:account/data/dto/profile_photo_response.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';

part 'account_api.g.dart';

const headers = <String, dynamic>{
  'Content-Type': 'multipart/form-data',
};

final accountApiProvider = Provider.autoDispose<AccountApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return AccountApi(dio);
});

@RestApi()
abstract class AccountApi {
  factory AccountApi(Dio dio) => _AccountApi(dio);

  @POST('api/v1/me/profile-photo')
  @MultiPart()
  Future<ProfilePhotoResponse> uploadProfilePhoto(
    @Part(name: 'photo', contentType: 'image/*') File photo,
  );

  @GET('api/v1/me')
  Future<MeResponse> me();

  @PATCH('api/v1/me')
  Future<MeResponse> updateMe(@Body() Map<String, dynamic> body);

  @DELETE('api/v1/me')
  Future<DeleteMeResponse> deleteMe();
}
