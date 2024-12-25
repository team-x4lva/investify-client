import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investify/core/router/router.gr.dart';
import 'package:investify/core/widgets/fullscreen_loading.dart';
import 'package:investify/core/widgets/investify_pie_chart.dart';
import 'package:investify/core/widgets/widgets.dart';
import 'package:investify/data/remote/models/allocation/allocation.dart';
import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:investify/presentation/generated_portfolio/bloc/generated_portfolio_bloc.dart';

@RoutePage()
class GeneratedPortfolio extends StatefulWidget {
  const GeneratedPortfolio(
      {super.key,
      required this.portfolio,
      required this.days,
      required this.amount});
  final FinalGeneratedPortfolio portfolio;
  final int days;
  final double amount;

  @override
  State<GeneratedPortfolio> createState() => _GeneratedPortfolioState();
}

class _GeneratedPortfolioState extends State<GeneratedPortfolio> {
  bool gettingSimulation = false;

  @override
  Widget build(BuildContext context) {
    final saveBloc = context.read<GeneratedPortfolioBloc>();
    final theme = Theme.of(context);
    final allocations = widget.portfolio.generatedPortfolio.allocation;

    return BlocListener<GeneratedPortfolioBloc, GeneratedPortfolioState>(
      bloc: saveBloc,
      listener: (context, state) {
        if (state is SaveDone && gettingSimulation) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          context.router.push(SimulationRoute(
              portfolioId: state.portfolioId,
              amount: widget.amount,
              date: DateTime.now().add(Duration(days: widget.days))));
        } else if (state is SaveInProgress) {
          showFullscreenLoading(context);
        } else if (state is SaveError) {
          if (Navigator.canPop(context)) Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: theme.colorScheme.error,
            content: Text(
              'Ошибка при сохранении',
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Портфель',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                _showSaveDialog(context, saveBloc);
              },
              icon: const Icon(Icons.save_alt_rounded),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                InvestifyAnimatedWidget(
                  index: 1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: InvestifyPieChart(dataMap: {
                      for (var allocation in allocations)
                        allocation.category: allocation.percentage
                    }),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Прогноз',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      AnimatedTypingText(
                        widget.portfolio.generatedPortfolio.rationale,
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                AllocationInfoWidget(allocations: allocations),
                InvestifyButton(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Получить симуляцию',
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  onTap: () {
                    _showSimulationDialog(context, saveBloc);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSaveDialog(BuildContext context, GeneratedPortfolioBloc saveBloc) {
    final TextEditingController controller = TextEditingController();

    showCupertinoDialog(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return CupertinoAlertDialog(
          title: const Text('Сохранить портфель'),
          content: Column(
            children: [
              const Text('Введите название для сохранения.'),
              const SizedBox(height: 10),
              CupertinoTextField(
                style: TextStyle(color: theme.colorScheme.onSurface),
                controller: controller,
                placeholder: 'Введите название',
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  saveBloc.add(
                      SavePortfolioEvent(widget.portfolio, controller.text));
                  Navigator.pop(context);
                }
              },
              child:
                  const Text('Сохранить', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  void _showSimulationDialog(
      BuildContext context, GeneratedPortfolioBloc saveBloc) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Получить симуляцию'),
          content: const Text(
              'Вы действительно хотите получить симуляцию? Этот портфель сохранится.'),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Нет'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
                _showSaveDialog(context, saveBloc);
                gettingSimulation = true;
              },
              child: const Text('Да', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}

class AllocationInfoWidget extends StatelessWidget {
  final List<Allocation> allocations;

  const AllocationInfoWidget({
    super.key,
    required this.allocations,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Распределение активов',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...allocations
              .where(
                (element) => element.instruments.isNotEmpty,
              )
              .map((allocation) => InvestifyAnimatedWidget(
                  index: 2, child: AllocationCard(allocation: allocation))),
        ],
      ),
    );
  }
}

class AllocationCard extends StatelessWidget {
  final Allocation allocation;

  const AllocationCard({
    super.key,
    required this.allocation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.surface.withOpacity(1),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  allocation.category,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${(allocation.percentage * 100)}%',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: allocation.instruments.map((instrument) {
                return Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainer.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${(instrument.percentage * 100).toString()}%',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        instrument.name,
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
