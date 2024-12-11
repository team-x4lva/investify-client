import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PortfoliosPage extends StatefulWidget {
  const PortfoliosPage({super.key});

  @override
  State<PortfoliosPage> createState() => _PortfoliosPageState();
}

class _PortfoliosPageState extends State<PortfoliosPage> {
  String? selectedValue; // Track selected value

  // Example list of items
  final List<String> _list = [
    'Мое портфолио',
    'Цветной метал',
    'Агресивная стратегия',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: CustomDropdown<String>(
        hintText: 'Выберите портфолио',
        items: _list,
        decoration: CustomDropdownDecoration(
          closedFillColor: theme.colorScheme.surface,
          expandedFillColor: theme.colorScheme.surface,
          headerStyle: theme.textTheme.titleLarge,
          listItemStyle: theme.textTheme.titleMedium,
          closedBorderRadius: BorderRadius.circular(10),
          expandedBorderRadius: BorderRadius.circular(10),
          closedBorder: Border.all(
            color: theme.colorScheme.surfaceContainer,
          ),
          expandedBorder: Border.all(color: theme.colorScheme.surfaceContainer),
        ),
        initialItem: _list[0],
        onChanged: (value) {},
      )),
      body: const Center(
        child: Text('Portfolios Page'),
      ),
    );
  }
}
