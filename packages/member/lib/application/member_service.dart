import 'dart:isolate';

import 'package:common/common.dart';
import 'package:member/application/imember_service.dart';
import 'package:member/data/dto/member_response.dart';
import 'package:member/data/dto/members_response.dart';
import 'package:member/data/repository/imember_repository.dart';
import 'package:member/data/repository/member_repository.dart';
import 'package:member/domain/member_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memberServiceProvider = Provider.autoDispose<IMemberService>((ref) {
  final memberRepository = ref.watch(memberRepositoryProvider);

  return MemberService(memberRepository);
});

final class MemberService implements IMemberService {
  final IMemberRepository _memberRepository;

  const MemberService(this._memberRepository);

  @override
  Future<Result<MemberModel, Failure>> getMember(String id) async {
    try {
      final response = await _memberRepository.getMember(id);
      final result = await Isolate.run(() => _mapToUser(response));

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<List<MemberModel>, Failure>> getMembers() async {
    try {
      final response = await _memberRepository.getMembers();
      final result = await Isolate.run(() => _mapToUsers(response));

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }
}

List<MemberModel> _mapToUsers(MembersResponse response) {
  final data = response.data;

  return data
      .map(
        (e) => MemberModel(
          id: e.id,
          name: e.name,
          email: e.email,
          phoneNumber: e.phoneNumber,
          photo: e.photo,
          roles: e.role.map((e) => e.name.name).toList(),
        ),
      )
      .toList();
}

MemberModel _mapToUser(MemberResponse response) {
  final data = response.data;

  return MemberModel(
    id: data.id,
    name: data.name,
    email: data.email,
    phoneNumber: data.phoneNumber,
    photo: data.photo,
    roles: data.role.map((e) => e.name.name).toList(),
  );
}
