import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:investify/core/router/router.gr.dart';
import 'package:investify/core/widgets/widgets.dart';

@RoutePage()
class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedText(
                  'Собери портфель',
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
                        validator: SetupValidation.validateDays,
                        keyboardType: TextInputType.number,
                        controller: daysController,
                        hintText: 'Приблизительный срок в днях'),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InvestifyTextInput(
                        validator: SetupValidation.validateAmount,
                        keyboardType: TextInputType.number,
                        controller: moneyController,
                        hintText: 'Введите сумму инвестиций (₽)'),
                  ),
                ],
              ),
              InvestifyButton(
                showShadow: false,
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
                  if (_formKey.currentState?.validate() ?? false) {
                    final days = int.tryParse(daysController.text) ?? 0;
                    final amount = double.tryParse(moneyController.text
                            .replaceAll('₽', '')
                            .replaceAll(' ', '')) ??
                        0;
                    context.router
                        .push(DetailsRoute(days: days, amount: amount));
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class SetupValidation {
  static String? validateDays(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите количество дней';
    }

    final days = int.tryParse(value);
    if (days == null) {
      return 'Введите корректное число';
    }

    if (days <= 0) {
      return 'Количество дней должно быть больше 0';
    }

    if (days > 3650) {
      return 'Максимальный период инвестирования 3650 дней';
    }

    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите сумму инвестиций';
    }

    final cleanValue = value.replaceAll('₽', '').replaceAll(' ', '');

    final amount = double.tryParse(cleanValue);
    if (amount == null) {
      return 'Введите корректную сумму';
    }

    if (amount <= 0) {
      return 'Сумма должна быть больше 0';
    }

    if (amount < 1000) {
      return 'Минимальная сумма инвестиций 1000₽';
    }

    if (amount > 10000000) {
      return 'Максимальная сумма инвестиций 10,000,000₽';
    }

    return null;
  }
}
