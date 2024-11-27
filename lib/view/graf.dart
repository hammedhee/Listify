import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
        child: PieChart(
          PieChartData(
              sections: [
                PieChartSectionData(
                  color: const Color.fromARGB(255, 170, 0, 255),
                  value: 45,
                  title: '45%',
                  titleStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  radius: 100,
                ),
                PieChartSectionData(
                  color: const Color.fromARGB(255, 34, 0, 255),
                  value: 20,
                  title: '20%',
                  titleStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  radius: 100,
                ),
                PieChartSectionData(
                  color: const Color.fromARGB(255, 72, 255, 0),
                  value: 35,
                  title: '35%',
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
        ),
      ),
    );
  }
}
