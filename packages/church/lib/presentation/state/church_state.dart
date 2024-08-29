import 'package:church/domain/church_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'church_state.freezed.dart';

@freezed
abstract class ChurchState with _$ChurchState {
  factory ChurchState({
    @Default(AsyncLoading()) AsyncValue<List<ChurchModel>> churchList,
    ChurchModel? selectedChurch,
  }) = _ChurchState;
}
