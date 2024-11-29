import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  final _storage = const FlutterSecureStorage();

  // Сохранение токена и ID пользователя
  Future<void> saveAuthData(String token, String userId) async {
    await _storage.write(key: 'auth_token', value: token);
    await _storage.write(key: 'user_id', value: userId);
  }

  // Получение токена
  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  // Получение ID пользователя
  Future<String?> getUserId() async {
    return await _storage.read(key: 'user_id');
  }

  // Удаление данных авторизации
  Future<void> clearAuthData() async {
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'user_id');
  }
}
