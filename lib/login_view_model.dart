import 'auth_repository.dart';

class LoginViewModel {
  final AuthRepository _authRepository;

  LoginViewModel(this._authRepository);

  Future<void> login(String username, String password) async {
    await _authRepository.login(username, password);
  }
}
