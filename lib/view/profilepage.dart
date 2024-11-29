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
      appBar: AppBar(
        leading: Icon(Icons.person),
        title: Text("ACCOUNT'S"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 320,
                child: Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  elevation: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 144, 56, 185),
                              radius: 35,
                              child: Center(
                                child: Image.asset(
                                    'asset/new_defalt_profile_image_for-removebg-preview.png'),
                              ),
                            ),
                            Gap(10),
                            Text(
                              'Muhammed nk',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        Gap(10),
                        ExpansionTile(
                          title: Text('Password'),
                          children: [
                            Text('PASSWORD : muhammedsha@123'),
                            Gap(10)
                          ],
                        ),
                        Gap(10),
                        ExpansionTile(
                          title: Text('Mail Address'),
                          children: [
                            Text('MAIL ID : Muhammednk536@gmail.com'),
                            Gap(10)
                          ],
                        ),
                        Gap(10),
                        ExpansionTile(
                          title: Text('Mobile Number'),
                          children: [
                            Text('PHONE NUMBER : 9037356018'),
                            Gap(10)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 170,
                    child: Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 10,
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "help");
                          },
                          child: Text(
                            "Help",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 170,
                    child: Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 10,
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/login");
                          },
                          child: Text(
                            "Sign out ",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 80,
                width: double.infinity,
                child: Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  elevation: 10,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "tearms");
                      },
                      child: Text(
                        "Terms & Condition",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
