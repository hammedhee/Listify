import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(35),
            Container(
              height: 250,
              width: 250,
              child: Padding(
                padding: const EdgeInsets.only(right: 1),
                child: Lottie.asset('asset/Animation - 1732181932124.json'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome To ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Gap(5),
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Colors.purple,
                      Colors.blue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    'Listify',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            Gap(14),
            Text(
              '"Sign up today and turn your grocery chaos into a',
              style: TextStyle(
                  color: const Color.fromARGB(255, 93, 93, 93),
                  fontStyle: FontStyle.italic),
            ),
            Text(
              ' perfectly planned list!"',
              style: TextStyle(
                  color: const Color.fromARGB(255, 93, 93, 93),
                  fontStyle: FontStyle.italic),
            ),
            Gap(30),
            Container(
              height: 340,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Gap(55),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 128, 128, 128)),
                          prefixIcon: Icon(Icons.person),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 243, 250, 255),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    Gap(40),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 128, 128, 128)),
                          prefixIcon: Icon(Icons.password),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 243, 250, 255),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    Gap(40),
                    ElevatedButton(
                        onPressed: () {}, child: Text('Register now'))
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.blue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account! please",
                ),
                Gap(7),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
