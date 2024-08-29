import 'package:member/data/dto/member_response.dart';
import 'package:member/data/dto/members_response.dart';

abstract interface class IMemberRepository {
  Future<MemberResponse> getMember(String id);

  Future<MembersResponse> getMembers();
}
