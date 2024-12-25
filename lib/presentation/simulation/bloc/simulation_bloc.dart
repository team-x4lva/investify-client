import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/data/remote/models/simulation/simulation.dart';
import 'package:investify/data/remote/models/simulation_api/simulation_api.dart';
import 'package:investify/data/remote/portfolio_request.dart';

part 'simulation_event.dart';
part 'simulation_state.dart';

class SimulationBloc extends Bloc<SimulationEvent, SimulationState> {
  SimulationBloc() : super(SimulationInitial()) {
    on<GetSimulationEvent>((event, emit) async {
      emit(SimulationLoading());
      try {
        final request = PortfolioRequest(dio: GetIt.I<Dio>());
        final simulation = Simulation(
            portfolioId: event.portfolioId,
            endDate: event.endDate,
            moneyAmount: event.moneyAmount);
        final respnose = await request.getSimulation(simulation);
        emit(SimulationLoaded(data: respnose));
      } catch (e) {
        emit(SimulationError(e.toString()));
      }
    });
  }
}
