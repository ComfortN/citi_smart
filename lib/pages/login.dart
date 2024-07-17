import 'package:citi_smart/constants.dart';
import 'package:citi_smart/pages/login/login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// void main() {
//   runApp(const MyApp());
// }

const double defaultPadding = 16.0;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: kPrimaryColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(defaultPadding),
        // ignore: unnecessary_const
        child: LoginForm(),
      ),
    );
  }
}
