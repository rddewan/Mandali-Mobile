part of core;

abstract class ITokenService {
  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> storeAccessToken(String accessToken, String refreshToken);

  Future<void> clearTokens();

  Future<RefreshTokenResponse> refreshToken(String? refreshToken);
}
