part of common;

final loggerProvider = Provider.family<Logger, String>((ref, name) {
  return Logger(name);
});
