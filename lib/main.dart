import 'package:flutter/material.dart';
import 'package:listify/view/homeScreen.dart';
import 'package:listify/view/loginpage.dart';
import 'package:listify/view/signUpPage.dart';
import 'package:listify/view/splashscreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      routes: {
        '/home' :(context) => Homescreen(),
        '/login':(context) => Loginpage() ,
        'signup':(context) => Signuppage(),
      },
    );
  }
}
