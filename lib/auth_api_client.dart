import 'package:core/core.dart';

class AuthApiClient {
  final ApiClient _apiClient;

  AuthApiClient(this._apiClient);

  Future<dynamic> login(String username, String password) {
    return _apiClient.post('/composite/v1/login', {'username': username, 'password': password, "type": "phone"});
  }
}
