// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Simulation _$SimulationFromJson(Map<String, dynamic> json) => Simulation(
      portfolioId: (json['portfolioId'] as num).toInt(),
      endDate: DateTime.parse(json['endDate'] as String),
      moneyAmount: (json['moneyAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$SimulationToJson(Simulation instance) =>
    <String, dynamic>{
      'portfolioId': instance.portfolioId,
      'endDate': instance.endDate.toIso8601String(),
      'moneyAmount': instance.moneyAmount,
    };
