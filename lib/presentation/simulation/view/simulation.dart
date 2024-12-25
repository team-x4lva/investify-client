import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investify/core/widgets/widgets.dart';
import 'package:investify/data/remote/models/simulation_api/simulation_api.dart';
import 'package:investify/presentation/simulation/bloc/simulation_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

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
  late String futureState;
  late bool isPositiveFuture;
  late int moneyDifference;

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
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        body: BlocBuilder<SimulationBloc, SimulationState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is SimulationLoaded) {
                final accentColor = _getAccentColor(state.data);
                final daysDifference =
                    widget.date.difference(DateTime.now()).inDays;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width),
                      Text(
                        'Прогноз на $daysDifference ${getDaysEndingText(daysDifference)}',
                        style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      ContainerSimlutaion(
                        index: 1,
                        child: Column(
                          children: [
                            Text(
                              futureState,
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: SizedBox(
                                height: 200,
                                child: InvestifyLineChart(
                                  backendData: state.data.graph_points,
                                  color: accentColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ContainerSimlutaion(
                          index: 2,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  isPositiveFuture
                                      ? 'Прибыль составит $moneyDifference рублей'
                                      : 'Потери составят $moneyDifference рублей',
                                  style: theme.textTheme.titleLarge?.copyWith(
                                      color: accentColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Lottie.asset(
                                  isPositiveFuture
                                      ? 'assets/animations/profit.json'
                                      : 'assets/animations/losses.json',
                                  height: 250)
                            ],
                          ))
                    ],
                  ),
                );
              } else {
                return Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                      color: theme.primaryColor, size: 30),
                );
              }
            }));
  }

  Color _getAccentColor(SimulationApi simulation) {
    if (simulation.graph_points.isEmpty) return Colors.grey;

    // Compare first and last points from graph_points
    final firstPoint = simulation.graph_points.first.y;
    final lastPoint = simulation.graph_points.last.y;

    moneyDifference = (lastPoint - firstPoint).abs().toInt();

    if (lastPoint >= firstPoint) {
      isPositiveFuture = true;
      futureState = 'Положительный';
      return const Color(0xFF00C853); // Green
    } else {
      isPositiveFuture = false;
      futureState = 'Отрицательный';
      return const Color(0xFFD32F2F); // Red
    }
  }

  String getDaysEndingText(int days) {
    // Handle special cases for numbers ending in 11-14
    if (days % 100 >= 11 && days % 100 <= 14) {
      return 'дней';
    }

    // Get the last digit
    final lastDigit = days % 10;

    switch (lastDigit) {
      case 1:
        return 'день';
      case 2:
      case 3:
      case 4:
        return 'дня';
      default:
        return 'дней';
    }
  }
}

class ContainerSimlutaion extends StatelessWidget {
  const ContainerSimlutaion({super.key, required this.child, this.index = 1});
  final Widget child;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InvestifyAnimatedWidget(
      index: index,
      child: Container(
        decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainer.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.9,
        child: child,
      ),
    );
  }
}
