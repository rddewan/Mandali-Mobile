part of core;

final secureStorageProvider = Provider<ISecureStorage>((ref) {
  final flutterSecureStorage = ref.watch(flutterSecureStorageProvider);

  return SecureStorage(flutterSecureStorage);
});

class SecureStorage implements ISecureStorage {
  final FlutterSecureStorage _flutterSecureStorage;

  SecureStorage(this._flutterSecureStorage);

  @override
  Future<String?> read(String key) async {
    try {
      return await _flutterSecureStorage.read(key: key);
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<void> write(String key, String? value) async {
    try {
      await _flutterSecureStorage.write(key: key, value: value);
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _flutterSecureStorage.delete(key: key);
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }
}
