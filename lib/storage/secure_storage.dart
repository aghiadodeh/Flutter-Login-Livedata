import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// AES encryption is used for Android. AES secret key is encrypted
/// with RSA and RSA key is stored in KeyStore
/// https://pub.dev/packages/flutter_secure_storage
class SecureStorage {
  static const _storage = FlutterSecureStorage();
  static const _androidOptions = AndroidOptions(encryptedSharedPreferences: true);
  static const _iosOptions = IOSOptions(accessibility: IOSAccessibility.first_unlock);

  /// Write value
  static Future<void> write({required String key, required String value}) async {
    await _storage.write(
      key: key,
      value: value,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );
  }

  /// Read value
  static Future<dynamic> read({required String key}) async {
    return await _storage.read(
      key: key,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );
  }

  /// Delete all values
  static Future<void> deleteAll() async {
    await _storage.deleteAll(
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );
  }
}
