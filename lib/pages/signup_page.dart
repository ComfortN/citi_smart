import 'package:citi_smart/constants.dart';
import 'package:citi_smart/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:citi_smart/pages/signup/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        backgroundColor: kPrimaryLightColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(defaultPadding),
      child: SignUpForm(),
      ),
    );
  }
}