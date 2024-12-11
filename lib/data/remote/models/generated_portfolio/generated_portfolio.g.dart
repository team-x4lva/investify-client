// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedPortfolio _$GeneratedPortfolioFromJson(Map<String, dynamic> json) =>
    GeneratedPortfolio(
      allocation: (json['allocation'] as List<dynamic>)
          .map((e) => Allocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      rationale: json['rationale'] as String,
      strategy: json['strategy'] as String,
    );

Map<String, dynamic> _$GeneratedPortfolioToJson(GeneratedPortfolio instance) =>
    <String, dynamic>{
      'allocation': instance.allocation,
      'rationale': instance.rationale,
      'strategy': instance.strategy,
    };
