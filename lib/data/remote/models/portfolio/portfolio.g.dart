// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Portfolio _$PortfolioFromJson(Map<String, dynamic> json) => Portfolio(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      userId: (json['userId'] as num).toInt(),
      securities: (json['securities'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      share: (json['share'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$PortfolioToJson(Portfolio instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'securities': instance.securities,
      'share': instance.share,
    };
