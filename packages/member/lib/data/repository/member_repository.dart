import 'dart:io';

import 'package:common/common.dart';
import 'package:member/data/api/member_api.dart';
import 'package:member/data/dto/member_response.dart';
import 'package:member/data/dto/members_response.dart';
import 'package:member/data/repository/imember_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memberRepositoryProvider = Provider.autoDispose<IMemberRepository>((ref) {
  final memberApi = ref.watch(memberApiProvider);

  return MemberRepository(memberApi);
});

final class MemberRepository implements IMemberRepository {
  final MemberApi _memberApi;

  MemberRepository(this._memberApi);

  @override
  Future<MemberResponse> getMember(String id) async {
    try {
      return await _memberApi.getMember(id);
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
  Future<MembersResponse> getMembers() async {
    try {
      return await _memberApi.getMembers();
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
