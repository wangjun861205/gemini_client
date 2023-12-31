// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerationConfigImpl _$$GenerationConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerationConfigImpl(
      stopSequences: (json['stopSequences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      temperature: (json['temperature'] as num).toDouble(),
      maxOutputTokens: json['maxOutputTokens'] as int,
      topP: (json['topP'] as num).toDouble(),
      topK: json['topK'] as int,
    );

Map<String, dynamic> _$$GenerationConfigImplToJson(
        _$GenerationConfigImpl instance) =>
    <String, dynamic>{
      'stopSequences': instance.stopSequences,
      'temperature': instance.temperature,
      'maxOutputTokens': instance.maxOutputTokens,
      'topP': instance.topP,
      'topK': instance.topK,
    };

_$SettingsImpl _$$SettingsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsImpl(
      apiKey: json['apiKey'] as String,
      safetySettings: SafetySettings.fromJson(
          (json['safetySettings'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList()),
      generationConfig: GenerationConfig.fromJson(
          json['generationConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SettingsImplToJson(_$SettingsImpl instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'safetySettings': instance.safetySettings,
      'generationConfig': instance.generationConfig,
    };
