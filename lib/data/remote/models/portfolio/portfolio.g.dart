// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Portfolio _$PortfolioFromJson(Map<String, dynamic> json) => Portfolio(
      name: json['name'] as String,
      userId: (json['userId'] as num).toInt(),
      securitiesIds: (json['securitiesIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      share: (json['share'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$PortfolioToJson(Portfolio instance) => <String, dynamic>{
      'name': instance.name,
      'userId': instance.userId,
      'securitiesIds': instance.securitiesIds,
      'share': instance.share,
    };
