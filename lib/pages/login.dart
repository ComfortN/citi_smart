import 'package:citi_smart/constants.dart';
import 'package:citi_smart/pages/login/login_form.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

const double defaultPadding = 16.0;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: kPrimaryColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: LoginForm(),
      ),
    );
  }
}
