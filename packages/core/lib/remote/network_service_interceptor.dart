part of core;

class NetworkServiceInterceptor extends Interceptor {
  final Dio _dio;
  final ISecureStorage _secureStorage;
  final String refreshTokenPath = '/api/v1/auth/refresh';

  NetworkServiceInterceptor(this._dio, this._secureStorage);

  Future<void> _clearAuthTokens() async {
    Future.wait([
      _secureStorage.delete(churchIdKey),
      _secureStorage.delete(accessTokenKey),
      _secureStorage.delete(refreshTokenKey),
    ]);
  }

  void _setAuthTokens(String accessToken, String refreshToken) async {
    await _secureStorage.write(accessTokenKey, accessToken);
    await _secureStorage.write(refreshTokenKey, refreshToken);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _secureStorage.read(accessTokenKey);
    options.headers['Accept'] = 'application/json';
    options.headers['Accept-Language'] = 'en';
    options.headers['Authorization'] = 'Bearer $accessToken';

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle unauthorized error
    if (err.response?.statusCode == 401) {
      final token = await _secureStorage.read(refreshTokenKey);

      try {
        final response = await _dio.post<Map<String, dynamic>>(
          refreshTokenPath,
          data: {
            "refreshToken": token,
          },
        );

        final json = response.data;
        final result = RefreshTokenResponse.fromJson(json ?? {});

        final statusCode = response.statusCode;

        if (statusCode == success) {
          final accessToken = result.data.accessToken;
          final refreshToken = result.data.refreshToken;
          // store token in secure storage
          _setAuthTokens(accessToken, refreshToken);

          final options = err.requestOptions;
          //// Update the request header with the new access token
          options.headers['Authorization'] = 'Bearer $accessToken';
          // Repeat the request with the updated header
          return handler.resolve(await _dio.fetch(options));
        }
      } on DioException catch (e) {
        // if refresh token is expired
        if (e.response?.statusCode == refreshTokenExpired) {
          await _clearAuthTokens();
          // refresh token expired - set status code 498
          err.response?.statusCode = refreshTokenExpired;

          return handler.next(err);
        }
        //continue with error
        return handler.next(err);
      }
    }

    return handler.next(err); //continue with error
  }
}
