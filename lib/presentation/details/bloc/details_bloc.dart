import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:investify/data/remote/models/generate_portfolio/generate_portfolio.dart';
import 'package:investify/domain/remote_repositories/portfolio_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final PortfolioRepository portfolioRepository;
  DetailsBloc(this.portfolioRepository) : super(DetailsInitial()) {
    on<GeneratePortfolioEvent>((event, emit) async {
      await _onGeneratePortfolio(emit, event);
    });
  }

  Future<void> _onGeneratePortfolio(
      Emitter<DetailsState> emit, GeneratePortfolioEvent event) async {
    emit(PortfolioLoading());
    try {
      final endDate = DateTime.now().add(Duration(days: event.days));
      final generatePortfolio = GeneratePortfolio(
          moneyAmount: event.moneyAmount,
          endDate: endDate,
          volatility: event.volatility / 100,
          desiredInstrumentsCategories: event.desiredInstrumentsCategories);
      final portfolio =
          await portfolioRepository.generatePortfolio(generatePortfolio);
      emit(PortfolioLoaded(portfolio: portfolio));
    } catch (e) {
      emit(PortfolioError());
    }
  }
}
