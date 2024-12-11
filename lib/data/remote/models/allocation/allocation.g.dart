// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Allocation _$AllocationFromJson(Map<String, dynamic> json) => Allocation(
      category: json['category'] as String,
      instruments: (json['instruments'] as List<dynamic>)
          .map((e) => Instrument.fromJson(e as Map<String, dynamic>))
          .toList(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$AllocationToJson(Allocation instance) =>
    <String, dynamic>{
      'category': instance.category,
      'instruments': instance.instruments,
      'percentage': instance.percentage,
    };
