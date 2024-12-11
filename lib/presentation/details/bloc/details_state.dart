part of 'details_bloc.dart';

sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class PortfolioLoading extends DetailsState {}

final class PortfolioLoaded extends DetailsState {
  final FinalGeneratedPortfolio portfolio;

  PortfolioLoaded({required this.portfolio});
}

final class PortfolioError extends DetailsState {}
