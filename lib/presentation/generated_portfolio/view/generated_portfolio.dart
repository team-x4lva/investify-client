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
  const GeneratedPortfolio({super.key, required this.portfolio});
  final FinalGeneratedPortfolio portfolio;

  @override
  State<GeneratedPortfolio> createState() => _GeneratedPortfolioState();
}

class _GeneratedPortfolioState extends State<GeneratedPortfolio> {
  @override
  Widget build(BuildContext context) {
    final saveBloc = context.read<GeneratedPortfolioBloc>();
    final theme = Theme.of(context);
    final allocations = widget.portfolio.generatedPortfolio.allocation;

    return BlocListener<GeneratedPortfolioBloc, GeneratedPortfolioState>(
      bloc: saveBloc,
      listener: (context, state) {
        if (state is SaveDone) {
          if (mounted) Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Успешно сохранено'),
          ));
        } else if (state is SaveInProgress) {
          showFullscreenLoading(context);
        } else {
          if (mounted) Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: theme.colorScheme.error,
            content: const Text('Ошибка при сохранении'),
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

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Сохранить портфель'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Введите название',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  saveBloc.add(SavePortfolioEvent(widget.portfolio));
                  Navigator.pop(context);
                }
              },
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  void _showSimulationDialog(
      BuildContext context, GeneratedPortfolioBloc saveBloc) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Получить симуляцию'),
          content: const Text(
              'Вы действительно хотите получить симуляцию? Этот портфель сохранится.'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Нет'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                saveBloc.add(SavePortfolioEvent(widget.portfolio));
                Navigator.pop(context);
              },
              child: const Text('Да'),
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
          ...allocations.map((allocation) => InvestifyAnimatedWidget(
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
                  '${(allocation.percentage * 100).toStringAsFixed(1)}%',
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
                return Chip(
                  label: Column(
                    children: [
                      Text(
                        '${(instrument.percentage * 100).toString()}%',
                        style: theme.textTheme.bodySmall,
                      ),
                      Text(
                        instrument.name,
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  backgroundColor: theme.colorScheme.secondaryContainer,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
