part of 'generated_portfolio_bloc.dart';

sealed class GeneratedPortfolioEvent {}

class SavePortfolioEvent extends GeneratedPortfolioEvent {
  final FinalGeneratedPortfolio portfolio;
  final String name;

  SavePortfolioEvent(this.portfolio, this.name);
}
