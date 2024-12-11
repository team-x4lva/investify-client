part of 'simulation_bloc.dart';

sealed class SimulationEvent {}

class GetSimulationEvent extends SimulationEvent {
  final DateTime endDate;
  final int portfolioId;
  final double moneyAmount;

  GetSimulationEvent(
      {required this.endDate,
      required this.portfolioId,
      required this.moneyAmount});
}
