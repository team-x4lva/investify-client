// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'generate_portfolio.g.dart';

@JsonSerializable()
class GeneratePortfolio {
  final double moneyAmount;
  final DateTime endDate;
  final double volatility;
  final List<String> desiredInstrumentsCategories;

  GeneratePortfolio({
    required this.moneyAmount,
    required this.endDate,
    required this.volatility,
    required this.desiredInstrumentsCategories,
  });

  factory GeneratePortfolio.fromJson(Map<String, dynamic> json) =>
      _$GeneratePortfolioFromJson(json);

  Map<String, dynamic> toJson() => _$GeneratePortfolioToJson(this);
}
