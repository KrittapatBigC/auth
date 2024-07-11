import 'package:authentication/models/login.dart';

import 'auth_api_client.dart';

class AuthRepository {
  final AuthApiClient _authApiClient;

  AuthRepository(this._authApiClient);

  Future<Login> login(String username, String password) async {
    dynamic d = await _authApiClient.login(username, password);
    print(d['data']);
    return Login.fromJson(d['data']);
  }
}
