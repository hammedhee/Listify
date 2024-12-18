import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:listify/function/graffunction.dart';
import 'package:listify/model/grafModel.dart';

// ignore: must_be_immutable
class Viewlistpage extends StatefulWidget {
  String? name;
  String? weight;
  Viewlistpage({super.key, required this.name, required this.weight});

  @override
  State<Viewlistpage> createState() => _ViewlistpageState();
}

class _ViewlistpageState extends State<Viewlistpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("See Your List's"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 340,
              child: Card(
                color: const Color.fromARGB(255, 189, 0, 222),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        '👇🏻See your grocery items👇🏻',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Gap(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                'Item Name :',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Gap(20),
                              Text(
                                widget.name.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            ],
                          ),
                          Gap(18),
                          Row(
                            children: [
                              Text(
                                'Item Quantity :',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Gap(20),
                              Text(
                                widget.weight.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(29.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      String text1 = "UnCompleted";
                      final completeddd = GrafListData(notcomplete: text1);
                      addgrafData(completeddd);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 24, 24),
                          content: Text(' Let’s make it happen! BUDDY ')));
                      Navigator.pushReplacementNamed(context, 'navigation');
                    },
                    child: Container(
                      height: 60,
                      width: 157,
                      child: Card(
                        color: Colors.amberAccent,
                        child: Center(
                          child: Text(
                            'Pending',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                  GestureDetector(
                    onTap: () {
                      String text2 = "Completed";
                      final completeddd = GrafListData(completed: text2);
                      addgrafData(completeddd);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: const Color.fromARGB(255, 5, 156, 0),
                          content: Text(
                              'Congratulations on successfully completing your task 👍🏻')));
                      Navigator.pushReplacementNamed(context, 'navigation');
                    },
                    child: Container(
                      width: 157,
                      height: 60,
                      child: Card(
                        color: const Color.fromARGB(255, 26, 255, 5),
                        child: Center(
                            child: Text(
                          'Completed',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
