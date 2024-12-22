import 'package:flutter/material.dart';
// import 'package:task3/src/feature/home/screens/home.dart';
import 'package:task3/src/feature/home/screens/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  );
  }
}