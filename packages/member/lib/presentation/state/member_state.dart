import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member/domain/member_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'member_state.freezed.dart';

@freezed
abstract class MemberState with _$MemberState {
  factory MemberState({
    @Default(false) bool isLoading,
    @Default(AsyncValue.loading()) AsyncValue<List<MemberModel>> members,
    MemberModel? member,
    String? errorMsg,
    int? statusCode,
  }) = _MemberState;
}
