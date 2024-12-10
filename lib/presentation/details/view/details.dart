import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:investify/core/widgets/custom_slider.dart';
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
                  index: 2, child: CustomSlider(onValueChanged: (_) {})),
              SizedBox(height: MediaQuery.of(context).size.height * 0.35),
              InvestifyAnimatedWidget(
                  index: 3,
                  child: InvestifyButton(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        'Собрать портфель',
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
