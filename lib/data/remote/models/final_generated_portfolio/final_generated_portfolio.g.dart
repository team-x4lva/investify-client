// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'final_generated_portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinalGeneratePortfolio _$FinalGeneratePortfolioFromJson(
        Map<String, dynamic> json) =>
    FinalGeneratePortfolio(
      generatedPortfolio: GeneratedPortfolio.fromJson(
          json['generatedPortfolio'] as Map<String, dynamic>),
      userPreferences: UserPreferences.fromJson(
          json['userPreferences'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FinalGeneratePortfolioToJson(
        FinalGeneratePortfolio instance) =>
    <String, dynamic>{
      'generatedPortfolio': instance.generatedPortfolio,
      'userPreferences': instance.userPreferences,
    };
