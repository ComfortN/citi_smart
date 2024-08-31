import 'package:citi_smart/firebase_options.dart';

import 'package:citi_smart/pages/account_page.dart';
import 'package:citi_smart/pages/create_page.dart';
import 'package:citi_smart/pages/donation_page.dart';
import 'package:citi_smart/pages/edu_page.dart';
import 'package:citi_smart/pages/home.dart';
import 'package:citi_smart/pages/landing.dart';
import 'package:citi_smart/pages/login/login_form.dart';
import 'package:citi_smart/pages/signup/signup_form.dart';
import 'package:citi_smart/pages/social_page.dart';
import 'package:citi_smart/screens/impact_anaylsis_dashboard.dart';

import 'package:citi_smart/pages/landing.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:citi_smart/constants.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

// import 'firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );


  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Citi smart',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/edu': (context) => EducationalPage(),
        '/donation': (context) => DonationPage(),
        '/create': (context) => CreatePage(),
        '/social': (context) => SocialPage(),
        '/account': (context) => AccountPage(),
        '/login': (context) => const LoginForm(),
        '/signup': (context) => const SignUpForm(),
        '/impact': (context) => ImpactAnalysisDashboard(
              cleanupId: '',
            ),
      },

      title: 'Citi Smart',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: const Color.fromARGB(255, 32, 73, 34),
      ),
      home: const Welcome(),

    );
  }
}
