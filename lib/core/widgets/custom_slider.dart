import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:investify/core/widgets/widgets.dart';

class CustomSlider extends StatefulWidget {
  final ValueChanged<String> onValueChanged;

  const CustomSlider({required this.onValueChanged, super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final List<String> options = [
    "Консервативный",
    "Сбалансировано",
    "Агрессивно"
  ];
  double currentValue = 50;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterSlider(
          values: [currentValue],
          min: 0,
          max: 100,
          tooltip: FlutterSliderTooltip(disabled: true),
          trackBar: FlutterSliderTrackBar(
            inactiveTrackBarHeight: 30,
            activeTrackBarHeight: 30,
            inactiveTrackBar: BoxDecoration(
              color: theme.hintColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            activeTrackBar: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          handler: FlutterSliderHandler(
            decoration: const BoxDecoration(), // Убираем декорацию
            child: const SizedBox.shrink(), // Заменяем на пустой виджет
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            setState(() {
              currentValue = lowerValue;
              if (currentValue < 33.33) {
                widget.onValueChanged(options[0]);
              } else if (currentValue < 66.66) {
                widget.onValueChanged(options[1]);
              } else {
                widget.onValueChanged(options[2]);
              }
            });
          },
        ),
        const SizedBox(height: 8),
        InvestifyAnimatedWidget(
          index: 2,
          child: AnimatedText(
            currentValue < 33.33
                ? options[0]
                : currentValue < 66.66
                    ? options[1]
                    : options[2],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
