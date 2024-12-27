import 'package:flutter/material.dart';
//import 'package:task3/src/feature/home/screens/info.dart';
import 'package:task3/src/feature/home/screens/splash_screen.dart';
// import 'package:task3/src/feature/home/screens/home.dart';
//import 'package:task3/src/feature/home/screens/login.dart';
//import 'package:task3/src/feature/home/screens/mass.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash()
    //InfoScreen()
    //MassScreen()
    //LoginScreen(),
  );
  }
}