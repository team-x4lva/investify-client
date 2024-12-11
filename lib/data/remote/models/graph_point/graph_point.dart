// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'graph_point.g.dart';

@JsonSerializable()
class GraphPoint {
  final double x;
  final double y;
  GraphPoint({
    required this.x,
    required this.y,
  });

  factory GraphPoint.fromJson(Map<String, dynamic> json) =>
      _$GraphPointFromJson(json);

  Map<String, dynamic> toJson() => _$GraphPointToJson(this);
}
