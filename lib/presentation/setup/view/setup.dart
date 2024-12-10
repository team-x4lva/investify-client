import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:investify/core/router/router.gr.dart';
import 'package:investify/core/widgets/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

@RoutePage()
class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final daysController = TextEditingController();
  final moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Начините инвестировать прямо сейчас',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InvestifyTextInput(
                      controller: daysController,
                      hintText: 'Приблизительный срок в днях'),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InvestifyTextInput(
                      controller: moneyController,
                      hintText: 'Введите сумму инвестиций     ₽'),
                ),
              ],
            ),
            InvestifyButton(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Продолжить',
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: theme.colorScheme.onSurface,
                  )
                ],
              ),
              onTap: () {
                if (daysController.text.isNotEmpty ||
                    moneyController.text.isNotEmpty) {
                  context.router.push(const DetailsRoute());
                }
              },
            )
          ],
        ),
      )),
    );
  }
}

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SfDateRangePicker(
        enablePastDates: false,
        showNavigationArrow: true,
        selectionColor: theme.primaryColor,
        todayHighlightColor: theme.primaryColor,
        backgroundColor: theme.colorScheme.surface,
        headerStyle: DateRangePickerHeaderStyle(
          backgroundColor: theme.colorScheme.surface,
          textStyle: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
