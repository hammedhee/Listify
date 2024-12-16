import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:listify/function/groseryListFunctions.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: groseryListNotifyr,
          builder: (context, value, child) {
            final completed = value.where((eee) => eee.value == true).toList();
            final NotCompleted =
                value.where((eee) => eee.value == false).toList();
            return PieChart(
              PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: const Color.fromARGB(255, 170, 0, 255),
                      value: completed.length.toDouble(),
                      title: 'Completed',
                      titleStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      radius: 100,
                    ),
                    PieChartSectionData(
                      color: const Color.fromARGB(255, 34, 0, 255),
                      value: NotCompleted.length.toDouble(),
                      title: "${NotCompleted.length}",
                      titleStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      radius: 100,
                    ),
                  ],
                  centerSpaceRadius: 55,
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 4,
                  centerSpaceColor: const Color.fromARGB(255, 255, 255, 255)),
            );
          },
        ),
      ),
    );
  }
}
