// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulation_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimulationApi _$SimulationApiFromJson(Map<String, dynamic> json) =>
    SimulationApi(
      graph_points: (json['graph_points'] as List<dynamic>)
          .map((e) => GraphPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SimulationApiToJson(SimulationApi instance) =>
    <String, dynamic>{
      'graph_points': instance.graph_points,
    };
