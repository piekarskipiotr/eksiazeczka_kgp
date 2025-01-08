import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  final _secureStorage = const FlutterSecureStorage();
  static const supabaseSessionKey = '3c81ad1ad7a716c4543cbac8fb2797fcd01e9d303236ee4c78d78282531fc0c1';

  Future<void> writeSecureData(String key, String? value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> readSecureData(String key) async {
    final readData = await _secureStorage.read(key: key);
    return readData;
  }

  Future<void> deleteSecureData(String key) async {
    await _secureStorage.delete(key: key);
  }
}
