// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:investify/data/remote/models/allocation/allocation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated_portfolio.g.dart';

@JsonSerializable()
class GeneratedPortfolio {
  GeneratedPortfolio(
      {required this.allocation,
      required this.rationale,
      required this.strategy});

  final List<Allocation> allocation;
  final String rationale;
  final String strategy;

  factory GeneratedPortfolio.fromJson(Map<String, dynamic> json) =>
      _$GeneratedPortfolioFromJson(json);

  Map<String, dynamic> toJson() => _$GeneratedPortfolioToJson(this);
}
