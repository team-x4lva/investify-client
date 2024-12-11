import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:investify/core/widgets/investify_text_input.dart';

@RoutePage()
class SimulationPage extends StatelessWidget {
  const SimulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        InvestifyTextInput(
          hintText: 'На сколько дней вперед получить симуляцию',
          controller: TextEditingController(),
        ),
      ]),
    );
  }
}
