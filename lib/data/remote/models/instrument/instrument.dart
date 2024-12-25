// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'instrument.g.dart';

@JsonSerializable()
class Instrument {
  Instrument(this.name, {required this.id, required this.percentage});

  final String name;
  final int? id;
  final double percentage;
  factory Instrument.fromJson(Map<String, dynamic> json) =>
      _$InstrumentFromJson(json);

  Map<String, dynamic> toJson() => _$InstrumentToJson(this);
}
