// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    UserPreferences(
      strategy: json['strategy'] as String,
      allocationPreferences: (json['allocationPreferences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      preferredInstruments: (json['preferredInstruments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserPreferencesToJson(UserPreferences instance) =>
    <String, dynamic>{
      'strategy': instance.strategy,
      'allocationPreferences': instance.allocationPreferences,
      'preferredInstruments': instance.preferredInstruments,
    };
