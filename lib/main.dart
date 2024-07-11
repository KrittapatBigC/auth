import 'package:authentication/auth_api_client.dart';
import 'package:authentication/auth_repository.dart';
import 'package:authentication/login_screen.dart';
import 'package:authentication/login_view_model.dart';
import 'package:core/ui/base_loading.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';


void main() {
  final apiClient = HttpClient();
  final authApiClient = AuthApiClient(apiClient);
  final authRepository = AuthRepository(authApiClient);
  final loginViewModel = LoginViewModel(authRepository);

  runApp(MyApp(loginViewModel: loginViewModel));
}

class MyApp extends StatelessWidget {
  final LoginViewModel loginViewModel;

  MyApp({required this.loginViewModel});

  @override
  Widget build(BuildContext context) {
    BaseLoading().configLoading();
    return MaterialApp(
      home: LoginScreen(loginViewModel: loginViewModel),
      builder: BaseLoading().baseLoadingInit(),
    );
  }
}