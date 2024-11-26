import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  bool fruitsBoxValue = false;
  bool powdersBoxValue = false;
  bool vegetableBoxValue = false;
  bool othersBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(30),
            Lottie.asset('asset/Animation for add page.json',
                height: 200, width: 200, fit: BoxFit.fitHeight),
            Text('Make Your List', style: GoogleFonts.lato(fontSize: 20)),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.purpleAccent]),
                ),
                child: Column(
                  children: [
                    Gap(15),
                    foraddpagecontainer('Grocery Name', 'Enter Grocery Name'),
                    Gap(10),
                    foraddpagecontainer('Quantity', 'Enter The Quantity'),
                    Gap(10),
                    Container(
                      height: 150,
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Gap(15),
                          Text(
                            'Category',
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              addPageCatagory(fruitsBoxValue, 'Fruits',
                                  (value) {
                                setState(() {
                                  fruitsBoxValue = value!;
                                });
                              }),
                              addPageCatagory(powdersBoxValue, 'Powders',
                                  (value) {
                                setState(() {
                                  powdersBoxValue = value!;
                                });
                              }),
                            ],
                          ),
                          Row(
                            children: [
                              addPageCatagory(vegetableBoxValue, 'Vegetable',
                                  (value) {
                                setState(() {
                                  vegetableBoxValue = value!;
                                });
                              }),
                              addPageCatagory(othersBoxValue, 'Others',
                                  (value) {
                                setState(() {
                                  othersBoxValue = value!;
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gap(15),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Add To List',
                          style: TextStyle(color: Colors.black),
                        )),
                    Gap(10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row addPageCatagory(
    bool value,
    String text,
    void Function(bool?) onChanged,
  ) {
    return Row(
      children: [
        Gap(12),
        Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
        Gap(10),
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Gap(10),
      ],
    );
  }

  Container foraddpagecontainer(String text, String text2) {
    return Container(
      height: 110,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 255, 254, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Gap(10),
          Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text2,
              prefixIcon: Icon(Icons.local_grocery_store),
            ),
          ),
        ],
      ),
    );
  }
}
