part of 'details_bloc.dart';

sealed class DetailsEvent {}

final class GeneratePortfolio extends DetailsEvent {
  final int days;
  final double moneyAmount;
  final List<String> desiredInstrumentsCategories;
  final double volatility;

  GeneratePortfolio(
      {required this.days,
      required this.moneyAmount,
      required this.desiredInstrumentsCategories,
      required this.volatility});
}
