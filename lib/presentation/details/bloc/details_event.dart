part of 'details_bloc.dart';

sealed class DetailsEvent {}

final class MakePortfolio extends DetailsEvent {
  final int days;
  final double amount;
  final List<String> instruments;
  final String strategy;

  MakePortfolio(
      {required this.days,
      required this.amount,
      required this.instruments,
      required this.strategy});
}
