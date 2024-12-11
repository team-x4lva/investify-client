import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:investify/core/widgets/fullscreen_loading.dart';

import '../bloc/simulation_bloc.dart';

@RoutePage()
class SimulationPage extends StatefulWidget {
  const SimulationPage(
      {super.key,
      required this.portfolioId,
      required this.amount,
      required this.date});
  final int portfolioId;
  final double amount;
  final DateTime date;

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  final bloc = SimulationBloc();
  @override
  void initState() {
    super.initState();
    bloc.add(GetSimulationEvent(
      endDate: widget.date,
      portfolioId: widget.portfolioId,
      moneyAmount: widget.amount,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          BlocBuilder<SimulationBloc, SimulationState>(
            bloc: bloc,
            builder: (context, state) {
              return switch (state) {
                SimulationLoading() => Builder(builder: (context) {
                    showFullscreenLoading(context);
                    return const SizedBox();
                  }),
                SimulationLoaded(:final data) => SizedBox(
                    height: 300,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: false),
                        titlesData: const FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: List.generate(
                              data['data'].length,
                              (index) => FlSpot(
                                index.toDouble(),
                                double.parse(data['data'][index].toString()),
                              ),
                            ),
                            isCurved: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                SimulationError(:final message) =>
                  Center(child: Text('Error: $message')),
                SimulationInitial() => const SizedBox(),
              };
            },
          )
        ]),
      ),
    );
  }
}
