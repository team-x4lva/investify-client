import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:investify/domain/auth_manager/auth_manager.dart';
import 'package:investify/domain/local_repositories/portfolio_repository.dart';

part 'generated_portfolio_event.dart';
part 'generated_portfolio_state.dart';

class GeneratedPortfolioBloc
    extends Bloc<GeneratedPortfolioEvent, GeneratedPortfolioState> {
  final LocalPortfolioRepository localPortfolioRepository;
  GeneratedPortfolioBloc(this.localPortfolioRepository)
      : super(GeneratedPortfolioInitial()) {
    on<SavePortfolioEvent>((event, emit) async {
      emit(SaveInProgress());
      try {
        final authManager = GetIt.I<AuthManager>();
        final userId = await authManager.getId();
        // await localPortfolioRepository.savePortfolio(event.portfolio);
        emit(SaveDone());
      } catch (e) {
        emit(SaveError());
      }
    });
  }
}
