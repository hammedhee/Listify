import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Make Your List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: 180,
              child: Lottie.asset('asset/Animation for add page.json',
                  fit: BoxFit.contain),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Container(
                width: 350,
                height: 450,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.purpleAccent])),
                child: Column(
                  children: [
                    Gap(10),
                    foraddpagecontainer('Grocery Name', 'Enter Grocery Name'),
                    Gap(10),
                    foraddpagecontainer('Quantity', 'Enter The Quantity'),
                    Gap(10),
                    Container(
                      height: 110,
                      width: 280,
                      child: Column(
                        children: [Text('')],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Gap(10),
                    ElevatedButton(onPressed: () {}, child: Text('Add To List'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container foraddpagecontainer(String text, String text2) {
    return Container(
        height: 110,
        width: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 255, 254, 255)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(15),
            Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: text2,
                  prefixIcon: Icon(Icons.local_grocery_store)),
            )
          ],
        ));
  }
}
