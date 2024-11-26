import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text('Accounts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(10),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.purpleAccent]),
                      color: const Color.fromARGB(255, 196, 196, 196),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Gap(30),
                      InkWell(
                        onTap: () {
                          // for user image update
                        },
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor:
                              const Color.fromARGB(255, 252, 251, 250),
                          child: Image.asset(
                              'asset/new_defalt_profile_image_for-removebg-preview.png'),
                        ),
                      ),
                      Gap(16),
                      Text(
                        'Muhammed',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      Gap(40),
                      GestureDetector(
                          onTap: () {},
                          child: containerforprofile('User details')),
                      Gap(40),
                      GestureDetector(
                          onTap: () {},
                          child: containerforprofile('Terms and conditions')),
                      Gap(40),
                      GestureDetector(
                          onTap: () {},
                          child: containerforprofile('User arguments')),
                      Gap(40),
                      GestureDetector(
                          onTap: () {}, child: containerforprofile('Help')),
                      Gap(40),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Container(
                          height: 50,
                          width: 260,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            'Log out',
                            style: TextStyle(
                                fontSize: 16, color: Colors.redAccent),
                          )),
                        ),
                      ),
                      Gap(40)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container containerforprofile(String text) {
    return Container(
      height: 50,
      width: 260,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 16),
      )),
    );
  }
}
