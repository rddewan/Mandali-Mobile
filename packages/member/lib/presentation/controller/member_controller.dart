import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member/application/member_service.dart';
import 'package:member/presentation/state/member_state.dart';

final memberControllerProvider =
    AutoDisposeNotifierProvider<MemberController, MemberState>(
  MemberController.new,
);

class MemberController extends AutoDisposeNotifier<MemberState> {
  @override
  MemberState build() {
    return MemberState();
  }

  Future<void> getMembers() async {
    final result = await ref.read(memberServiceProvider).getMembers();

    result.when((success) {
      state = state.copyWith(
        members: AsyncData(success),
      );
    }, (error) {
      state = state.copyWith(
        members: AsyncError(error, error.stackTrace),
      );
    });
  }

  Future<void> getMember(String id) async {
    // if id is the same, do nothing
    if (state.member?.id == int.parse(id)) return;

    state = state.copyWith(
      isLoading: true,
      errorMsg: null,
      statusCode: null,
    );

    final result = await ref.read(memberServiceProvider).getMember(id);

    result.when((success) {
      state = state.copyWith(
        member: success,
        isLoading: false,
      );
    }, (error) {
      state = state.copyWith(
        isLoading: false,
        errorMsg: error.message,
        statusCode: error.statusCode,
      );
    });
  }

  Future<void> refresh() async {
    state = state.copyWith(members: const AsyncLoading());
    final result = await ref.read(memberServiceProvider).getMembers();

    result.when((success) {
      state = state.copyWith(
        members: AsyncData(success),
      );
    }, (error) {
      state = state.copyWith(
        members: AsyncError(error, error.stackTrace),
      );
    });
  }
}
