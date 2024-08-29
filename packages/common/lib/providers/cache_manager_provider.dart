part of common;

final cacheManagerProvider = Provider<CacheManager>((ref) {
  return CacheManager(
    Config(
      'onlineCatalogCache',
      stalePeriod: const Duration(days: 14),
      maxNrOfCacheObjects: 500,
    ),
  );
});
