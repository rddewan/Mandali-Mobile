import 'package:freezed_annotation/freezed_annotation.dart';

part 'church_model.freezed.dart';

@freezed
abstract class ChurchModel with _$ChurchModel {
  factory ChurchModel({
    required int id,
    required String name,
    required String address,
  }) = _ChurchModel;
}
