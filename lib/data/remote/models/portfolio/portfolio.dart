import 'package:investify/data/remote/models/final_generated_portfolio/final_generated_portfolio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portfolio.g.dart';

@JsonSerializable()
class Portfolio {
  const Portfolio({
    required this.name,
    required this.userId,
    required this.securitiesIds,
    required this.share,
  });

  final String name;
  final int userId;
  final List<int> securitiesIds;
  final List<double> share;

  factory Portfolio.fromFinalPortfolio(
      FinalGeneratedPortfolio finalPortfolio, String name, int userId) {
    return Portfolio(
      name: name,
      userId: userId,
      securitiesIds: finalPortfolio.generatedPortfolio.allocation
          .expand((allocation) => allocation.instruments)
          .where((instrument) => instrument.id != null)
          .map((instrument) => instrument.id!)
          .toList(),
      share: finalPortfolio.generatedPortfolio.allocation
          .map(
            (allocation) => allocation.percentage,
          )
          .toList(),
    );
  }

  factory Portfolio.fromJson(Map<String, dynamic> json) =>
      _$PortfolioFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioToJson(this);
}
