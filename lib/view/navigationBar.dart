import 'package:flutter/material.dart';
import 'package:listify/view/homeScreen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int CurruntIndex = 0;
  final List<Widget> pagesForNavigation = [
    Homescreen(),
    Homescreen(),
    Homescreen(),
    Homescreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesForNavigation[CurruntIndex],
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: Colors.amberAccent,
          onTap: (index) {
            setState(() {
              CurruntIndex = index;
            });
          },
          currentIndex: CurruntIndex,
          items: [
            SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('home')),
            SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('home')),
            SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('home')),
            SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('home'))
          ]),
    );
  }
}
