import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class InvestifyLineChart extends StatelessWidget {
  final List<Map<String, dynamic>> backendData = [
    {"x": 1, "y": 5},
    {"x": 2, "y": 10},
    {"x": 2.2, "y": 12},
    {"x": 3, "y": 18},
    {"x": 3.3, "y": 15},
    {"x": 4, "y": 25},
    {"x": 5, "y": 50},
    {"x": 8, "y": 55},
    {"x": 10, "y": 60},
    {"x": 25, "y": 45},
    {"x": 30, "y": 70},
  ];

  InvestifyLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Преобразуем данные от бэкенда в список FlSpot
    List<FlSpot> spots = backendData
        .map((point) => FlSpot(point['x'].toDouble(), point['y'].toDouble()))
        .toList();

    return LineChart(
      LineChartData(
        titlesData: const FlTitlesData(show: false),
        gridData: FlGridData(
          show: false,
          drawVerticalLine: true,
          horizontalInterval: 5,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: theme.hintColor.withOpacity(0.0),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: theme.hintColor.withOpacity(0.1),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: false,
          border: Border.all(
            color: theme.hintColor.withOpacity(0.1),
            width: 1,
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: false,
            barWidth: 4.5,
            color: Colors.green,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Colors.green.withOpacity(0.0),
                  Colors.green.withOpacity(0.1),
                  Colors.green.withOpacity(0.5),
                ],
              ),
            ),
            dotData: FlDotData(
              show: false,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Colors.green,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            gradient: const LinearGradient(
              colors: [Colors.green, Colors.lightGreenAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }
}
