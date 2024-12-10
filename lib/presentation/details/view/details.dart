import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:investify/core/widgets/animated_typing_text.dart';
import 'package:investify/core/widgets/investify_animated_widget.dart';
import 'package:investify/core/widgets/picker_widget.dart';
import 'package:investify/core/widgets/widgets.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> callbackList = [];
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedText(
                'Выбор инструментов и стратегии',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              InvestifyAnimatedWidget(
                index: 1,
                child: PickerWidget(elements: const [
                  'Акции',
                  'Облигации',
                  'Валюта',
                  'Золото',
                ], color: theme.primaryColor, pickedItems: callbackList),
              ),
              InvestifyAnimatedWidget(
                  index: 2, child: CustomSlider(onValueChanged: (_) {}))
            ],
          ),
        ),
      ),
    );
  }
}

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
              color: theme.hintColor.withOpacity(0.2),
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
          index: 3,
          child: Text(
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
