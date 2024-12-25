import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:investify/core/widgets/widgets.dart';

class CustomSlider extends StatefulWidget {
  final ValueChanged<double> onValueChanged;

  const CustomSlider(
      {required this.onValueChanged, super.key, required this.aboutStrategy});

  final Map<String, String> aboutStrategy;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final List<String> options = [
    "Консервативно",
    "Сбалансировано",
    "Агрессивно"
  ];
  double currentValue = 50;
  String currentOption = 'Сбалансировано';

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
            inactiveTrackBarHeight: 40,
            activeTrackBarHeight: 40,
            inactiveTrackBar: BoxDecoration(
              color: theme.hintColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            activeTrackBar: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          handler: FlutterSliderHandler(
            decoration: const BoxDecoration(), // Убираем декорацию
            child: const SizedBox.shrink(), // Заменяем на пустой виджет
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            setState(() {
              currentValue = lowerValue;
              widget.onValueChanged(currentValue);
              if (currentValue < 33.33) {
                currentOption = options[0];
              } else if (currentValue < 66.66) {
                currentOption = options[1];
              } else {
                currentOption = options[2];
              }
            });
          },
        ),
        const SizedBox(height: 8),
        InvestifyAnimatedWidget(
          index: 2,
          child: Text(
            currentOption,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        InvestifyAnimatedWidget(
          key: ValueKey(widget.aboutStrategy[currentOption]),
          duration: const Duration(milliseconds: 200),
          index: 2,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              widget.aboutStrategy[currentOption] ?? 'Ошибка',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
