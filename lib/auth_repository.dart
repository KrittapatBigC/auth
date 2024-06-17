import 'auth_api_client.dart';

class AuthRepository {
  final AuthApiClient _authApiClient;

  AuthRepository(this._authApiClient);

  Future<void> login(String username, String password) async {
    await _authApiClient.login(username, password);
  }
}
