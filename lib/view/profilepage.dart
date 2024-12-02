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
              child: ValueListenableBuilder(
                valueListenable: userDataNotifire,
                builder: (context, value, child) {
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
                                Gap(10),
                                Text(
                                  value.first.userName.toString(),
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            Gap(10),
                            ExpansionTile(
                              title: Text('Password'),
                              children: [
                                Text(
                                  value.first.passWord.toString(),
                                  style: TextStyle(fontSize: 17),
                                ),
                                Gap(10)
                              ],
                            ),
                            Gap(10),
                            ExpansionTile(
                              title: Text('Mail Address'),
                              children: [
                                Text('E-Mail Address'),
                                Text(value.first.mailId.toString()),
                                Gap(10)
                              ],
                            ),
                            Gap(10),
                            ExpansionTile(
                              title: Text('Mobile Number'),
                              children: [
                                Text('Mobile Number'),
                                Text(value.first.phoneNumber.toString()),
                                Gap(10)
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
                            logutbtn();
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
            ),
            // TextButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => Loginpage(),
            //           ));
            //     },
            //     child: Text('login'))
          ],
        ),
      ),
    );
  }

  Future logutbtn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDataBox = await Hive.openBox<UsreData>('userdeteals');
    prefs.setBool('isLoggedIn', false);
    userDataBox.clear();
    userDataNotifire.value.clear();
    prefs.clear();
    Navigator.pushReplacementNamed(context, "login");
  }
}
