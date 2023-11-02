import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/Screens/home_page.dart';
import 'package:flutter_practise/Screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_practise/Screens/upload_resturant.dart';
import 'package:flutter_practise/TimeCalculation.dart/time_calculation.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
