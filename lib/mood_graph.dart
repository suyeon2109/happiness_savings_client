import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MoodGraph extends StatefulWidget {
  const MoodGraph({Key? key}) : super(key: key);

  @override
  _MoodGraph createState() => _MoodGraph();
}

class _MoodGraph extends State<MoodGraph> {
  // Generate some dummy data for the cahrt
  // This will be used to draw the red line
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), Random().nextDouble() * index);
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), Random().nextDouble() * index);
  });

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), Random().nextDouble() * index);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Mood Graph',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
      body: SafeArea(
        child: Container(
          // alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(0, 200, 40, 0),
          width: double.infinity,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              lineBarsData: [
                // The red line
                LineChartBarData(
                  spots: dummyData1,
                  isCurved: true,
                  barWidth: 3,
                  colors: [
                    Colors.red,
                  ],
                ),
                // The orange line
                LineChartBarData(
                  spots: dummyData2,
                  isCurved: true,
                  barWidth: 3,
                  colors: [
                    Colors.orange,
                  ],
                ),
                // The blue line
                LineChartBarData(
                  spots: dummyData3,
                  isCurved: true,
                  barWidth: 3,
                  colors: [
                    Colors.blue,
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
