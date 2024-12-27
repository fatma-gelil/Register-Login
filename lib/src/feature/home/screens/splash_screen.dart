import 'package:flutter/material.dart';
import 'package:task3/src/feature/home/screens/info.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const InfoScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Hello !",
          style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}
