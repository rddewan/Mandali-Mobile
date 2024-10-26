part of core;

final networkServiceInterceptorProvider =
    Provider.family<NetworkServiceInterceptor, Dio>((ref, dio) {
  final tokenService = ref.watch(tokenServiceProvider(dio));
  return NetworkServiceInterceptor(tokenService, dio);
});

class NetworkServiceInterceptor extends Interceptor {
  final ITokenService _tokenService;
  final Dio _dio;

  NetworkServiceInterceptor(this._tokenService, this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get access token
    final accessToken = await _tokenService.getAccessToken();

    options.headers['Accept'] = 'application/json';
    options.headers['Accept-Language'] = 'en';
    options.headers['Authorization'] = 'Bearer $accessToken';

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle unauthorized error
    if (err.response?.statusCode == unauthorized) {
      final token = await _tokenService.getRefreshToken();

      try {
        final result = await _tokenService.refreshToken(token);

        final accessToken = result.data.accessToken;
        final refreshToken = result.data.refreshToken;

        // store token in secure storage
        _tokenService.storeAccessToken(accessToken, refreshToken);

        final options = err.requestOptions;
        //// Update the request header with the new access token
        options.headers['Authorization'] = 'Bearer $accessToken';
        // Repeat the request with the updated header
        return handler.resolve(await _dio.fetch(options));
      } on DioException catch (e) {
        // if refresh token is expired
        if (e.response?.statusCode == refreshTokenExpired) {
          await _tokenService.clearTokens();
          // refresh token expired - set status code 498
          // err.response?.statusCode = refreshTokenExpired;

          return handler.next(err);
        }
        //continue with error
        return handler.next(err);
      }
    }

    return handler.next(err); //continue with error
  }
}
