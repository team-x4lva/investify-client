import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investify/data/remote/models/graph_point/graph_point.dart';

class InvestifyLineChart extends StatelessWidget {
  final List<GraphPoint> backendData;
  final Color color;

  const InvestifyLineChart(
      {super.key, required this.backendData, required this.color});

  double _getInterval() {
    double max = 0;
    for (var point in backendData) {
      if (point.y > max) {
        max = point.y;
      }
    }
    return max / (max.toString().length + 15);
  }

  String formatNumber(double number) {
    if (number.abs() >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(1)}B';
    }
    if (number.abs() >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    }
    if (number.abs() >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Преобразуем данные от бэкенда в список FlSpot
    List<FlSpot> spots =
        backendData.map((point) => FlSpot(point.x, point.y)).toList();

    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          show: true,
          leftTitles: const AxisTitles(axisNameSize: 0),
          bottomTitles: const AxisTitles(axisNameSize: 0),
          topTitles: const AxisTitles(axisNameSize: 0),
          rightTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
            interval: _getInterval(),
            reservedSize:
                backendData.last.y.toString().length.toString().length * 40.0,
            getTitlesWidget: (value, meta) {
              String formattedValue = formatNumber(value);
              return Container(
                margin: const EdgeInsets.only(left: 7),
                child: Text(
                  formattedValue,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.hintColor.withOpacity(0.5),
                    fontSize: 13,
                  ),
                ),
              );
            },
          )),
        ),
        gridData: FlGridData(
          show: false,
          drawVerticalLine: false,
          horizontalInterval: _getInterval(),
          getDrawingHorizontalLine: (value) {
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
            barWidth: 2.5,
            color: color,
            belowBarData: BarAreaData(show: false, color: color),
            dotData: FlDotData(
              show: false,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: color,
                  strokeWidth: 1,
                  strokeColor: Colors.white,
                );
              },
            ),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }
}
