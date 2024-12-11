import 'package:flutter_bloc/flutter_bloc.dart';

part 'simulation_event.dart';
part 'simulation_state.dart';

class SimulationBloc extends Bloc<SimulationEvent, SimulationState> {
  SimulationBloc() : super(SimulationInitial()) {
    on<GetSimulationEvent>((event, emit) {
      emit(SimulationLoading());
      try {
        emit(SimulationLoaded());
      } catch (e) {
        emit(SimulationError(e.toString()));
      }
    });
  }
}
