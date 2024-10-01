import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") required Data data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "token") required TokenDto token,
    @JsonKey(name: "user") required UserDto user,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class TokenDto with _$TokenDto {
  const factory TokenDto({
    @JsonKey(name: "access_token") required String accessToken,
    @JsonKey(name: "refresh_token") required String refreshToken,
  }) = _TokenDto;

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);
}

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "phoneNumber") String? phoneNumber,
    @JsonKey(name: "photo") String? photo,
    @JsonKey(name: "role") required List<RoleDto> role,
    @JsonKey(name: "guild") required List<GuildDto> guild,
    @JsonKey(name: "church") required ChurchDto church,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

@freezed
class RoleDto with _$RoleDto {
  const factory RoleDto({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required UserRole name,
  }) = _RoleDto;

  factory RoleDto.fromJson(Map<String, dynamic> json) =>
      _$RoleDtoFromJson(json);
}

@freezed
class GuildDto with _$GuildDto {
  const factory GuildDto({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required UserGuild name,
  }) = _GuildDto;

  factory GuildDto.fromJson(Map<String, dynamic> json) =>
      _$GuildDtoFromJson(json);
}

@freezed
class ChurchDto with _$ChurchDto {
  const factory ChurchDto({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "timeZone") required String timeZone,
  }) = _ChurchDto;

  factory ChurchDto.fromJson(Map<String, dynamic> json) =>
      _$ChurchDtoFromJson(json);
}
