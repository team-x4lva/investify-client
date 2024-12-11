import 'package:json_annotation/json_annotation.dart';

part 'security.g.dart';

@JsonSerializable()
class Security {
  Security(
      {this.id,
      required this.name,
      required this.ticker,
      required this.category,
      this.isProfitable,
      required this.volatility});

  final int? id;
  final String name;
  final String ticker;
  final String category;
  final bool? isProfitable;
  final double volatility;

  factory Security.fromJson(Map<String, dynamic> json) =>
      _$SecurityFromJson(json);

  Map<String, dynamic> toJson() => _$SecurityToJson(this);
}
