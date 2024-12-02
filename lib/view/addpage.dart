import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listify/function/groseryListFunctions.dart';
import 'package:listify/model/groceryList.dart';
import 'package:listify/view/fruitslistpage.dart';
import 'package:listify/view/homescreen.dart';
import 'package:listify/view/navigationBar.dart';
import 'package:lottie/lottie.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

List<String> options = ["Fruits", "Vegetable", "Powders", "Others"];

class _AddpageState extends State<Addpage> {
  String? currentOption;
  TextEditingController groceryNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
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
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Gap(15),
                      foraddpagecontainer(
                          text: 'Grocery Name',
                          text2: 'Enter Grocery Name',
                          controller: groceryNameController),
                      Gap(10),
                      foraddpagecontainer(
                          text: 'Quantity',
                          text2: 'Enter The Quantity',
                          controller: quantityController),
                      Gap(10),
                      Container(
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 255, 254, 255),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(2, 2))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Fruits'),
                                  radiobuttem(0),
                                  Text('Vegetable'),
                                  radiobuttem(1),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Powders'),
                                  radiobuttem(2),
                                  Text('Others'),
                                  radiobuttem(3),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(15),
                      GestureDetector(
                        onTap: () {
                          saveListBtn();
                        },
                        child: Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 254, 255),
                            ),
                            child: Center(
                                child: Text(
                              'ADD TO LIST',
                              style: TextStyle(color: Colors.black),
                            ))),
                      ),
                      Gap(10),
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

  Radio<String> radiobuttem(int intex) {
    return Radio(
        value: options[intex],
        groupValue: currentOption,
        onChanged: (value) {
          setState(() {
            currentOption = value.toString();
          });
        });
  }

  Container foraddpagecontainer(
      {String? text, String? text2, TextEditingController? controller}) {
    return Container(
      height: 110,
      width: 280,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2))
        ],
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 255, 254, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Gap(10),
          Text(
            text!,
            style: TextStyle(fontSize: 18),
          ),
          TextField(
            controller: controller,
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

  Future saveListBtn() async {
    final itemName = groceryNameController.text.trim();
    final itemquantity = quantityController.text.trim();
    if (currentOption == null || itemName.isEmpty || itemquantity.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.cyanAccent,
          content: Center(
            child: Text(
              'Please Fill All Fealds !!.',
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
            ),
          )));
    } else {
      final groseryData = GroceryListData(
          groceryName: itemName,
          quantity: itemquantity,
          catocary: currentOption);
      addGroseryData(groseryData);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Navigationbar()));
    }
  }
}
