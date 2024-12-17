import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:listify/function/groseryListFunctions.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    getAllgroseryData();
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
      body: Column(
        children: [
          Gap(20),
          Padding(
            padding: const EdgeInsets.only(
              left: 124,
            ),
            child: Column(children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    color: const Color.fromARGB(255, 21, 255, 0),
                  ),
                  Gap(10),
                  Text('Completed Items'),
                ],
              ),
              Gap(30),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    color: const Color.fromARGB(255, 255, 179, 0),
                  ),
                  Gap(10),
                  Text('Pending Items')
                ],
              ),
            ]),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: groseryListNotifyr,
              builder: (context, value, child) {
                if (groseryListNotifyr.value.isEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No data available to display',
                        style: TextStyle(fontSize: 16),
                      ),
                      Gap(5),
                      Text(
                        '🤨',
                        style: TextStyle(fontSize: 35),
                      )
                    ],
                  );
                }

                final completed =
                    value.where((eee) => eee.value == true).toList();
                final NotCompleted =
                    value.where((eee) => eee.value == false).toList();
                return PieChart(
                  PieChartData(
                      sections: [
                        PieChartSectionData(
                          color: const Color.fromARGB(255, 21, 255, 0),
                          value: completed.length.toDouble(),
                          title: '${completed.length}',
                          titleStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          radius: 100,
                        ),
                        PieChartSectionData(
                          color: const Color.fromARGB(255, 255, 179, 0),
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
                      centerSpaceColor:
                          const Color.fromARGB(255, 255, 255, 255)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
