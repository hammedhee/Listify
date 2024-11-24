import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text('Settings'),
      ),
      body: Container(
        width: 330,
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     colors: [Colors.blueAccent, Colors.purpleAccent]),
            color: const Color.fromARGB(255, 196, 196, 196),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Column(
          children: [
            Gap(30),
            CircleAvatar(
              radius: 35,
              backgroundColor: const Color.fromARGB(255, 252, 251, 250),
              child: Image.asset(
                  'asset/new_defalt_profile_image_for-removebg-preview.png'),
            ),
            Gap(40),
            Container(
              height: 50,
              width: 270,
            decoration: BoxDecoration(
                color: Colors.white,
                
            ),
            )
          ],
        ),
      ),
    );
  }
}
