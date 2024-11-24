import 'package:flutter/material.dart';
import 'package:listify/view/addpage.dart';
import 'package:listify/view/graf.dart';
import 'package:listify/view/homescreen.dart';
import 'package:listify/view/settingspage.dart';
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
    Addpage(),
    Graf(),
    Settingspage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesForNavigation[CurruntIndex],
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          onTap: (index) {
            setState(() {
              CurruntIndex = index;
            });
          },
          currentIndex: CurruntIndex,
          items: [
            SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('HOME')),
            SalomonBottomBarItem(icon: Icon(Icons.add), title: Text('ADD')),
            SalomonBottomBarItem(
                icon: Icon(Icons.bar_chart), title: Text('CHART')),
            SalomonBottomBarItem(
                icon: Icon(Icons.settings), title: Text('SETTINGS'))
          ]),
    );
  }
}
