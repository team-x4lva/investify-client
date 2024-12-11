import 'package:json_annotation/json_annotation.dart';

part 'simulation.g.dart';

@JsonSerializable()
class Simulation {
  Simulation(
      {required this.portfolioId,
      required this.endDate,
      required this.moneyAmount});

  final int portfolioId;
  final DateTime endDate;
  final double moneyAmount;

  factory Simulation.fromJson(Map<String, dynamic> json) =>
      _$SimulationFromJson(json);

  Map<String, dynamic> toJson() => _$SimulationToJson(this);
}
