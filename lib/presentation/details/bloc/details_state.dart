part of 'details_bloc.dart';

sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class PortfolioLoading extends DetailsState {}

final class PortfolioLoaded extends DetailsState {
  final FinalGeneratePortfolio finalGeneratePortfolio;

  PortfolioLoaded({required this.finalGeneratePortfolio});
}

final class PortfolioError extends DetailsState {}
