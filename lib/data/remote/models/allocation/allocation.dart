// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'allocation.g.dart';

@JsonSerializable()
class Allocation {
  Allocation(
      {required this.category,
      required this.instruments,
      required this.percentage});

  final String category;
  final List<String> instruments;
  final double percentage;
  factory Allocation.fromJson(Map<String, dynamic> json) =>
      _$AllocationFromJson(json);

  Map<String, dynamic> toJson() => _$AllocationToJson(this);
}
