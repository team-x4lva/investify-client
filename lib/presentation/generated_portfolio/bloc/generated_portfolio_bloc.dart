import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:investify/data/remote/models/portfolio/portfolio.dart';
import 'package:investify/domain/auth_manager/auth_manager.dart';
import 'package:investify/domain/local_repositories/portfolio_repository.dart';
import 'package:investify/domain/remote_repositories/portfolio_repository.dart';

part 'generated_portfolio_event.dart';
part 'generated_portfolio_state.dart';

class GeneratedPortfolioBloc
    extends Bloc<GeneratedPortfolioEvent, GeneratedPortfolioState> {
  final LocalPortfolioRepository localPortfolioRepository;
  final PortfolioRepository portfolioRepository;
  GeneratedPortfolioBloc(
      this.localPortfolioRepository, this.portfolioRepository)
      : super(GeneratedPortfolioInitial()) {
    on<SavePortfolioEvent>((event, emit) async {
      emit(SaveInProgress());
      try {
        final authManager = GetIt.I<AuthManager>();
        final userId = await authManager.getId();
        final portfolio =
            Portfolio.fromFinalPortfolio(event.portfolio, event.name, userId);
        final id = await portfolioRepository.addPortfolio(portfolio);
        await localPortfolioRepository.savePortfolio(portfolio);
        emit(SaveDone(portfolioId: id));
      } catch (e) {
        emit(SaveError());
      }
    });
  }
}
