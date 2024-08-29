part of common;

final apiDateTimeProvider = Provider<DateFormat>((ref) {
  return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
});
