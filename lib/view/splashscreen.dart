import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    checkInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          Center(
            child: Lottie.asset('asset/Animation - 1732079983335.json'),
          ),
          Positioned(
            bottom: 0,
            right: 156,
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.redAccent, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                "Listify...",
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future checkInfo() async {
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final isloggedIn = prefs.getBool('isLoggedIn') ?? false;
      if (isloggedIn) {
        Navigator.pushReplacementNamed(context, 'navigation');
      } else {
        Navigator.pushReplacementNamed(context, "login");
      }
    });
  }
}
