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

  runApp(const MyApp());
}



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
