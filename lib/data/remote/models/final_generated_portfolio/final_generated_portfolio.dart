// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:investify/data/remote/models/generated_portfolio/generated_portfolio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'final_generated_portfolio.g.dart';

@JsonSerializable()
class FinalGeneratedPortfolio {
  FinalGeneratedPortfolio({
    required this.generatedPortfolio,
  });

  final GeneratedPortfolio generatedPortfolio;

  factory FinalGeneratedPortfolio.fromJson(Map<String, dynamic> json) =>
      _$FinalGeneratedPortfolioFromJson(json);

  Map<String, dynamic> toJson() => _$FinalGeneratedPortfolioToJson(this);
}
