import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:investify/data/remote/models/security/security.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portfolio.g.dart';

@JsonSerializable()
class Portfolio {
  const Portfolio({
    this.id,
    required this.name,
    required this.userId,
    required this.securities,
    required this.share,
  });

  final int? id;
  final String name;
  final int userId;
  final List<int> securities;
  final List<int> share;

  factory Portfolio.fromFinalPortfolio(
      FinalGeneratedPortfolio finalPortfolio, String name, int userId) {
    return Portfolio(
      name: name,
      userId: userId,
      securities: finalPortfolio.generatedPortfolio.allocation
          .expand((allocation) => allocation.instruments)
          .map((instrument) => instrument.id)
          .toList(),
      share: finalPortfolio.generatedPortfolio.allocation
          .map(
            (allocation) => allocation.percentage.toInt(),
          )
          .toList(),
    );
  }

  factory Portfolio.fromJson(Map<String, dynamic> json) =>
      _$PortfolioFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioToJson(this);
}
