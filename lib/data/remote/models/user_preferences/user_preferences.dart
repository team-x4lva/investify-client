// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_preferences.g.dart';

@JsonSerializable()
class UserPreferences {
  UserPreferences(
      {required this.strategy,
      required this.allocationPreferences,
      required this.preferredInstruments});
  final String strategy;
  final List<String> allocationPreferences;
  final List<String> preferredInstruments;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$UserPreferencesToJson(this);
}
