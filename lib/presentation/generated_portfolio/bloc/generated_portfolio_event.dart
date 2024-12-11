part of 'generated_portfolio_bloc.dart';

sealed class GeneratedPortfolioEvent {}

class SavePortfolioEvent extends GeneratedPortfolioEvent {
  final FinalGeneratedPortfolio portfolio;

  SavePortfolioEvent(this.portfolio);
}
