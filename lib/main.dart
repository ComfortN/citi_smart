import 'package:citi_smart/firebase_options.dart';
import 'package:citi_smart/pages/landing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:citi_smart/constants.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );

// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();

// Ideal time to initialize
// FirebaseAuth.instance
//   .authStateChanges()
//   .listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//     } else {
//       print('User is signed in!');
//     }
//   });;
  runApp(const MyApp());
}
// WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citi Smart',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: const Color.fromARGB(255, 32, 73, 34),
      ),
      home: const Welcome(),
    );
  }
}
