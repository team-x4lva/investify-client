// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:investify/data/remote/models/graph_point/graph_point.dart';

part 'simulation_api.g.dart';

@JsonSerializable()
class SimulationApi {
  SimulationApi({
    // ignore: non_constant_identifier_names
    required this.graph_points,
  });

  // ignore: non_constant_identifier_names
  final List<GraphPoint> graph_points;
  factory SimulationApi.fromJson(Map<String, dynamic> json) =>
      _$SimulationApiFromJson(json);

  Map<String, dynamic> toJson() => _$SimulationApiToJson(this);
}
