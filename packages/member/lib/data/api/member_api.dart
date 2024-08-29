import 'package:dio/dio.dart';
import 'package:member/data/dto/member_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter/foundation.dart';
import 'package:member/data/dto/members_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';

part 'member_api.g.dart';

final memberApiProvider = Provider.autoDispose<MemberApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return MemberApi(dio);
});

@RestApi(
  parser: Parser.FlutterCompute,
)
abstract class MemberApi {
  factory MemberApi(Dio dio) => _MemberApi(dio);

  @GET('api/v1/members/{id}')
  Future<MemberResponse> getMember(@Path() String id);

  @GET('api/v1/members')
  Future<MembersResponse> getMembers();
}
