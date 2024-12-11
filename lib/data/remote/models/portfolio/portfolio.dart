import 'package:json_annotation/json_annotation.dart';

part 'portfolio.g.dart';

@JsonSerializable()
class Portfolio {
  Portfolio(
      {required this.id,
      required this.name,
      required this.userId,
      required this.securitiesTickers});

  final int id;
  final String name;
  final int userId;
  final List<String> securitiesTickers;

  factory Portfolio.fromJson(Map<String, dynamic> json) =>
      _$PortfolioFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioToJson(this);
}
