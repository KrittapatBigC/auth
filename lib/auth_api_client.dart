import 'package:core/core.dart';

class AuthApiClient {
  final ApiClient _apiClient;

  AuthApiClient(this._apiClient);

  Future<dynamic> login(String username, String password) {
    return _apiClient.post('/login', {'username': username, 'password': password});
  }
}
