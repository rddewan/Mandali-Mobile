import 'package:church/application/church_service.dart';
import 'package:church/domain/church_model.dart';
import 'package:church/presentation/state/church_state.dart';
import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final churchControllerProvider =
    AutoDisposeNotifierProvider<ChurchController, ChurchState>(
  ChurchController.new,
);

class ChurchController extends AutoDisposeNotifier<ChurchState> {
  @override
  ChurchState build() {
    return ChurchState();
  }

  Future<void> findAll() async {
    final result = await ref.read(churchServiceProvider).findAll();

    result.when(
      (data) => {
        state = state.copyWith(
          churchList: AsyncData(data),
        ),
      },
      (error) => state = state.copyWith(
        churchList: AsyncError(error, StackTrace.current),
      ),
    );
  }

  Future<void> setSelectedChurch(ChurchModel? value) async {
    await ref
        .read(churchServiceProvider)
        .writeToSecureStorage(churchIdKey, value?.id.toString());

    state = state.copyWith(selectedChurch: value);
  }

  Future<void> clearSelectedChurch() async {
    state = state.copyWith(selectedChurch: null);
  }

  ChurchModel? getSelectedChurch() {
    return state.selectedChurch;
  }
}
