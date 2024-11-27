import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(35),
            Lottie.asset('asset/signup animation.json',
                height: 250, width: 250),
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
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    'Listify',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            Gap(14),
            Text(
              '"Plan smart, shop easy-',
              style: TextStyle(
                  color: const Color.fromARGB(255, 93, 93, 93),
                  fontStyle: FontStyle.italic),
            ),
            Text(
              'your perfect list, every time!"',
              style: TextStyle(
                  color: const Color.fromARGB(255, 93, 93, 93),
                  fontStyle: FontStyle.italic),
            ),
            Gap(30),
            Container(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Gap(40),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username!!.';
                          } else {
                            return null;
                          }
                        },
                        controller: usernameController,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.white),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                                color:
                                    const Color.fromARGB(255, 128, 128, 128)),
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 250, 255),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      Gap(40),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username!!.';
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.white),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color:
                                    const Color.fromARGB(255, 128, 128, 128)),
                            prefixIcon: Icon(Icons.password),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 250, 255),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      Gap(40),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              Navigator.pushReplacementNamed(
                                  context, 'navigation');
                            }
                          },
                          child: Text(' Log in ')),
                      Gap(40)
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.purple,
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
                  "Don't have an account yet? ",
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'signup');
                  },
                  child: Text(
                    "Sign Up",
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
