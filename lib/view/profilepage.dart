import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:listify/function/userdatafunctions.dart';
import 'package:listify/model/userdataModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  void initState() {
    super.initState();
    getAllUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person),
        title: const Text("ACCOUNT'S"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ValueListenableBuilder<List<UsreData>>(
                valueListenable: userDataNotifire,
                builder: (context, value, child) {
                  if (value.isEmpty) {
                    return const Text(
                      'NO USER DETAILS',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    );
                  }

                  final user = value.first;
                  return Container(
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
                                const Gap(10),
                                Text(
                                  user.userName.toString(),
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            const Gap(10),
                            ExpansionTile(
                              title: const Text('Password'),
                              children: [
                                Text(
                                  user.passWord.toString(),
                                  style: const TextStyle(fontSize: 17),
                                ),
                                const Gap(10)
                              ],
                            ),
                            const Gap(10),
                            ExpansionTile(
                              title: const Text('Mail Address'),
                              children: [
                                const Text('E-Mail Address'),
                                Text(user.mailId.toString()),
                                const Gap(10)
                              ],
                            ),
                            const Gap(10),
                            ExpansionTile(
                              title: const Text('Mobile Number'),
                              children: [
                                const Text('Mobile Number'),
                                Text(user.phoneNumber.toString()),
                                const Gap(10)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(30),
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
                          child: const Text(
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
                            logutbtn();
                          },
                          child: const Text(
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
            const Gap(10),
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
                      child: const Text(
                        "Terms & Condition",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logutbtn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDataBox = await Hive.openBox<UsreData>('userdeteals');
    prefs.setBool('isLoggedIn', false);
    userDataBox.clear();
    userDataNotifire.value.clear();
    prefs.clear();
    Navigator.pushReplacementNamed(context, "login");
  }
}
