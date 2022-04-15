import 'dart:convert';

import '../../models/user/user.dart';
import '../../storage/secure_storage.dart';

class AuthenticationManager {
  /// save user object in localStorage
  static login(User user, String token) async {
    final object = user.toJson();
    await SecureStorage.write(key: 'user', value: json.encode(object));
    await SecureStorage.write(key: 'token', value: token);
  }

  /// get User which saved in localStorage
  static Future<User> user() async {
    final user = await SecureStorage.read(key: 'user');
    return User.fromJson(json.decode(user ?? '{}'));
  }

  /// get jwt token from localStorage
  static Future<String> token() async {
    return await SecureStorage.read(key: 'token') ?? '';
  }

  /// return `true` if User object exists in localStorage
  static Future<bool> loggedIn() async {
    final object = await user();
    return object.id != null;
  }

  /// Clear localStorage and local-Database
  static logOut() async {
    await SecureStorage.deleteAll();
  }
}
