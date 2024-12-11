part of 'simulation_bloc.dart';

sealed class SimulationState {}

final class SimulationInitial extends SimulationState {}

final class SimulationLoading extends SimulationState {}

final class SimulationLoaded extends SimulationState {}

final class SimulationError extends SimulationState {
  final String message;

  SimulationError(this.message);
}
