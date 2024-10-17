part of core;

final tokenServiceProvider = Provider.family<ITokenService, Dio>((ref, dio) {
  final secureStorage = ref.watch(secureStorageProvider);
  return TokenService(dio, secureStorage);
});

class TokenService implements ITokenService {
  final Dio _dio;
  final ISecureStorage _secureStorage;

  TokenService(this._dio, this._secureStorage);

  @override
  Future<String?> getAccessToken() => _secureStorage.read(accessTokenKey);

  @override
  Future<String?> getRefreshToken() => _secureStorage.read(refreshTokenKey);

  @override
  Future<void> storeAccessToken(String accessToken, String refreshToken) async {
    await _secureStorage.write(accessTokenKey, accessToken);
    await _secureStorage.write(refreshTokenKey, refreshToken);
  }

  @override
  Future<void> clearTokens() async {
    await _secureStorage.delete(accessTokenKey);
    await _secureStorage.delete(refreshTokenKey);
  }

  @override
  Future<RefreshTokenResponse> refreshToken(String? refreshToken) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'api/v1/auth/refresh-token',
      data: {'refreshToken': refreshToken},
    );

    if (response.statusCode == success) {
      return RefreshTokenResponse.fromJson(response.data ?? {});
    } else {
      throw DioException(
        requestOptions: RequestOptions(path: 'api/v1/auth/refresh-token'),
        response: response,
      );
    }
  }
}
