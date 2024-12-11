// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'best_deposit_rates.g.dart';

@JsonSerializable()
class BestDepositRates {
  BestDepositRates(
      {required this.div, required this.percentages, required this.time});

  final List<String> div;
  final List<String> percentages;
  final List<String> time;

  factory BestDepositRates.fromJson(Map<String, dynamic> json) =>
      _$BestDepositRatesFromJson(json);

  Map<String, dynamic> toJson() => _$BestDepositRatesToJson(this);
}
