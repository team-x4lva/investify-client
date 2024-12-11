// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Security _$SecurityFromJson(Map<String, dynamic> json) => Security(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      ticker: json['ticker'] as String,
      category: json['category'] as String,
      isProfitable: json['isProfitable'] as bool?,
      volatility: (json['volatility'] as num).toDouble(),
    );

Map<String, dynamic> _$SecurityToJson(Security instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ticker': instance.ticker,
      'category': instance.category,
      'isProfitable': instance.isProfitable,
      'volatility': instance.volatility,
    };
