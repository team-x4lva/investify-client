part of 'generated_portfolio_bloc.dart';

sealed class GeneratedPortfolioState {}

final class GeneratedPortfolioInitial extends GeneratedPortfolioState {}

final class SaveInProgress extends GeneratedPortfolioState {}

final class SaveDone extends GeneratedPortfolioState {
  final int portfolioId;

  SaveDone({required this.portfolioId});
}

final class SaveError extends GeneratedPortfolioState {}
