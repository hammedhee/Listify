import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Gap(50),
            Row(
              children: [
                Gap(10),
                Stack(children: [
                  CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.amberAccent,
                      child: Center(
                        child: CircleAvatar(
                          radius: 40,
                          child: Image.asset(
                            'asset/new_defalt_profile_image_for-removebg-preview.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ))
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
