// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:investify/data/remote/models/generated_portfolio/generated_portfolio.dart';
import 'package:investify/data/remote/models/user_preferences/user_preferences.dart';
import 'package:json_annotation/json_annotation.dart';

part 'final_generated_portfolio.g.dart';

@JsonSerializable()
class FinalGeneratePortfolio {
  FinalGeneratePortfolio(
      {required this.generatedPortfolio, required this.userPreferences});

  final GeneratedPortfolio generatedPortfolio;
  final UserPreferences userPreferences;

  factory FinalGeneratePortfolio.fromJson(Map<String, dynamic> json) =>
      _$FinalGeneratePortfolioFromJson(json);

  Map<String, dynamic> toJson() => _$FinalGeneratePortfolioToJson(this);
}
