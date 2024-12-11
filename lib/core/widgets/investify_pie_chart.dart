import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investify/core/theme/app_colors.dart';

class InvestifyPieChart extends StatefulWidget {
  const InvestifyPieChart({super.key, required this.dataMap});
  final Map<String, double> dataMap;

  @override
  State<StatefulWidget> createState() => InvestifyPieChartState();
}

class InvestifyPieChartState extends State<InvestifyPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final total = widget.dataMap.values.reduce((a, b) => a + b);
    final dataKeys = widget.dataMap.keys.toList();
    final colors = [
      AppColors.contentColorBlue,
      AppColors.contentColorPurple,
      AppColors.contentColorYellow,
      AppColors.contentColorGreen,
      AppColors.contentColorRed,
    ];
    final badgeIcons = [
      'assets/icons/gold.png',
      'assets/icons/ruble.png',
      'assets/icons/bond.png',
      'assets/icons/journal.png',
      'assets/icons/barrel.png',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.dataMap.entries.map((entry) {
                final index = dataKeys.indexOf(entry.key);
                return PieChartIndicator(
                  text: entry.key,
                  color: colors[index % colors.length],
                );
              }).toList(),
            ),
          ),
          Expanded(
            flex: 3,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse?.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse!
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0, // Убрали spacing между секциями
                  centerSpaceRadius: 10, // Минимальное пространство в центре
                  sections: showingSections(
                      widget.dataMap, colors, badgeIcons, total),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(Map<String, double> dataMap,
      List<Color> colors, List<String> badgeIcons, double total) {
    final dataKeys = dataMap.keys.toList();

    return List.generate(dataMap.length, (i) {
      final isTouched = i == touchedIndex;
      final value = dataMap[dataKeys[i]]!;
      final percentage = ((value / total) * 100).toStringAsFixed(1);
      final fontSize = isTouched ? 20.0 : 12.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 50.0 : 40.0;

      return PieChartSectionData(
        color: colors[i % colors.length],
        value: value,
        title: '$percentage%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        badgeWidget: _Badge(
          badgeIcons[i % badgeIcons.length],
          size: widgetSize,
          borderColor: AppColors.contentColorBlack,
        ),
        badgePositionPercentageOffset: 1.0,
      );
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.imageAsset, {
    required this.size,
    required this.borderColor,
  });
  final String imageAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Image.asset(
          imageAsset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class PieChartIndicator extends StatelessWidget {
  const PieChartIndicator({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
