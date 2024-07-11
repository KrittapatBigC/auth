import 'package:authentication/models/login.dart';

import 'auth_repository.dart';

class LoginViewModel {
  final AuthRepository _authRepository;

  LoginViewModel(this._authRepository);

  Future<Login> login(String username, String password) async {
    Login d = await _authRepository.login(username, password);
    return d;
  }
}
