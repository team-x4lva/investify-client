part of 'simulation_bloc.dart';

sealed class SimulationState {}

final class SimulationInitial extends SimulationState {}

final class SimulationLoading extends SimulationState {}

final class SimulationLoaded extends SimulationState {
  final Map<String, dynamic> data;

  SimulationLoaded({required this.data});
}

final class SimulationError extends SimulationState {
  final String message;

  SimulationError(this.message);
}
