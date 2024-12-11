// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_deposit_rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestDepositRates _$BestDepositRatesFromJson(Map<String, dynamic> json) =>
    BestDepositRates(
      div: (json['div'] as List<dynamic>).map((e) => e as String).toList(),
      percentages: (json['percentages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BestDepositRatesToJson(BestDepositRates instance) =>
    <String, dynamic>{
      'div': instance.div,
      'percentages': instance.percentages,
      'time': instance.time,
    };
