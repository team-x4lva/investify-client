import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investify/core/widgets/custom_slider.dart';
import 'package:investify/core/widgets/fullscreen_loading.dart';
import 'package:investify/core/widgets/widgets.dart';
import 'package:investify/presentation/details/bloc/details_bloc.dart';
import 'package:investify/core/router/router.gr.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.days, required this.amount});

  final int days;
  final double amount;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> callbackList = [];
  double volatility = 50.0;

  Map<String, String> aboutStrategy = {
    'Консервативно':
        'Консервативная стратегия фокусируется на защите вложенных средств, делая акцент на инструментах с фиксированной доходностью. Основная цель — обеспечение надежного источника дохода при минимальном уровне риска.',
    'Сбалансировано':
        'Сбалансированная стратегия сочетает умеренный риск с потенциалом роста, распределяя активы между акциями и облигациями. Она подходит для тех, кто хочет получать доход выше инфляции, сохраняя стабильность.',
    'Агрессивно':
        'Агрессивная стратегия ориентирована на максимальный рост капитала через вложения в акции, стартапы и высокорискованные активы. Она подойдет инвесторам, готовым к сильным колебаниям рынка ради высокой прибыли.',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final detailsBloc = context.read<DetailsBloc>();

    return BlocListener<DetailsBloc, DetailsState>(
      listener: (context, state) {
        if (state is PortfolioLoaded) {
          if (mounted) Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: theme.primaryColor,
              content: Text('Портфель собран!',
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ),
          );
          context.router.push(GeneratedPortfolio(portfolio: state.portfolio));
        } else if (state is PortfolioLoading) {
          showFullscreenLoading(context);
        } else {
          if (mounted) Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: theme.colorScheme.error,
              content: Text('Что-то пошло не так... Попробуйте позже',
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.47,
                    child: InvestifyAnimatedWidget(
                        index: 2,
                        child: CustomSlider(
                          onValueChanged: (value) {
                            volatility = value;
                          },
                          aboutStrategy: aboutStrategy,
                        )),
                  ),
                  InvestifyAnimatedWidget(
                      index: 3,
                      child: InvestifyButton(
                          showShadow: false,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            'Собрать портфель',
                            style: theme.textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            detailsBloc.add(GeneratePortfolioEvent(
                                days: widget.days,
                                moneyAmount: widget.amount,
                                desiredInstrumentsCategories: callbackList,
                                volatility: volatility));
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
