import 'package:common/common.dart';
import 'package:member/domain/member_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IMemberService {
  Future<Result<List<MemberModel>, Failure>> getMembers();

  Future<Result<MemberModel, Failure>> getMember(String id);
}
