import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:listify/function/userdatafunctions.dart';
import 'package:listify/model/userdataModel.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController maileController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(35),
            Padding(
              padding: const EdgeInsets.only(right: 1),
              child: Lottie.asset('asset/Animation - 1732181932124.json',
                  height: 180, width: 180),
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
                    colors: [Colors.purpleAccent, Colors.blueAccent],
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
            Gap(10),
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
            Gap(10),
            Container(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Gap(20),
                        TextFormField(
                          controller: userNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username.';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 128, 128, 128)),
                              prefixIcon: Icon(Icons.person),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 243, 250, 255),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        Gap(20),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password.';
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 128, 128, 128)),
                              prefixIcon: Icon(Icons.password),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 243, 250, 255),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        Gap(20),
                        TextFormField(
                          controller: phoneNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Phone Number.';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 128, 128, 128)),
                              prefixIcon: Icon(Icons.phone),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 243, 250, 255),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        Gap(20),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email id.';
                            } else {
                              return null;
                            }
                          },
                          controller: maileController,
                          decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              hintText: 'Email Id',
                              hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 128, 128, 128)),
                              prefixIcon: Icon(Icons.phone),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 243, 250, 255),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        Gap(20),
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() == true) {
                                registerBtn();
                              }
                            },
                            child: Text('Register now')),
                        Gap(20)
                      ],
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Gap(5),
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

  Future registerBtn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = userNameController.text.trim();
    final password = passwordController.text.trim();
    final phone = phoneNumberController.text.trim();
    final email = maileController.text.trim();

    if (username.isEmpty ||
        password.isEmpty && phone.isEmpty ||
        email.isEmpty) {
      return;
    } else {
      final data = UsreData(
          userName: username,
          passWord: password,
          phoneNumber: phone,
          mailId: email);
      addUserData(data);
      await prefs.setString('username', username);
      await prefs.setString('password', password);
      await prefs.setBool('isLoggedIn', true);
    }
    Navigator.pushReplacementNamed(context, "navigation");
  }
}
