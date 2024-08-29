import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_photo_response.freezed.dart';
part 'profile_photo_response.g.dart';

@freezed
class ProfilePhotoResponse with _$ProfilePhotoResponse {
  const factory ProfilePhotoResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") required String data,
  }) = _ProfilePhotoResponse;

  factory ProfilePhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfilePhotoResponseFromJson(json);
}
