import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:investify/domain/remote_repositories/portfolio_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final PortfolioRepository portfolioRepository;
  DetailsBloc(this.portfolioRepository) : super(DetailsInitial()) {
    on<DetailsEvent>((event, emit) {
      emit(PortfolioLoading());
      try {} catch (e) {}
    });
  }
}
