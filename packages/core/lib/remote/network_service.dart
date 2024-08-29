part of core;

final networkServiceProvider = Provider<Dio>((ref) {
  final envReader = ref.watch(envReaderProvider);
  final secureStorage = ref.watch(secureStorageProvider);

  final options = BaseOptions(
    baseUrl: envReader.getBaseUrl(),
    connectTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  final dio = Dio(options);

  dio.interceptors.addAll([
    HttpFormatter(),
    NetworkServiceInterceptor(dio, secureStorage),
  ]);

  final isCertificatePinning = envReader.getIsCertificatePinning();
  if (isCertificatePinning) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        final certBytes = envReader.getCertificate();
        final SecurityContext context = SecurityContext();

        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => false;
        context.setTrustedCertificatesBytes(certBytes);

        return HttpClient(context: context);
      },
    );
  }

  return dio;
});
