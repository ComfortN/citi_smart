import 'package:citi_smart/firebase_options.dart';
import 'package:citi_smart/pages/landing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

    );
  }
}
