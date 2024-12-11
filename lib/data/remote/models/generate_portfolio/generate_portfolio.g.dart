// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratePortfolio _$GeneratePortfolioFromJson(Map<String, dynamic> json) =>
    GeneratePortfolio(
      moneyAmount: (json['moneyAmount'] as num).toDouble(),
      endDate: DateTime.parse(json['endDate'] as String),
      volatility: (json['volatility'] as num).toDouble(),
      desiredInstrumentsCategories:
          (json['desiredInstrumentsCategories'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$GeneratePortfolioToJson(GeneratePortfolio instance) =>
    <String, dynamic>{
      'moneyAmount': instance.moneyAmount,
      'endDate': instance.endDate.toIso8601String(),
      'volatility': instance.volatility,
      'desiredInstrumentsCategories': instance.desiredInstrumentsCategories,
    };
