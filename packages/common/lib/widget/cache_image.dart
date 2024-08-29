part of common;

class CacheImage extends ConsumerWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit boxFit;
  final BlendMode? colorBlendMode;
  final Color? color;

  const CacheImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.boxFit = BoxFit.cover,
    this.colorBlendMode,
    this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: boxFit,
      colorBlendMode: colorBlendMode,
      color: color,
      placeholder: (context, url) => const Icon(Icons.image),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      cacheManager: ref.read(cacheManagerProvider),
    );
  }
}
