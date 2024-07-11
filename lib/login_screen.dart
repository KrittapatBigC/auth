import 'package:core/ui/base_loading.dart';
import 'package:flutter/material.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  final LoginViewModel loginViewModel;

  LoginScreen({required this.loginViewModel});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    BaseLoading().startLoading();
    await widget.loginViewModel.login(_usernameController.text, _passwordController.text);


    BaseLoading().stopLoading();
    // setState(() {
    //   _isLoading = true;
    // });
    //
    // try {
    //   dynamic d = await widget.loginViewModel.login(_usernameController.text, _passwordController.text);
    //   print(d);
    //   // Handle successful login
    // } catch (e) {
    //   // Handle login error
    // } finally {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
