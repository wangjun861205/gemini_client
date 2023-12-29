import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class SafetySetting with _$SafetySetting {
  const factory SafetySetting({
    required String category,
    required String threshold,
  }) = _SafetySetting;

  factory SafetySetting.fromJson(Map<String, Object?> json) =>
      _$SafetySettingFromJson(json);
}

@freezed
class GenerationConfig with _$GenerationConfig {
  const factory GenerationConfig({
    required List<String> stopSequences,
    double? temperature,
    int? maxOutputTokens,
    double? topP,
    int? topK,
  }) = _GenerationConfig;

  factory GenerationConfig.fromJson(Map<String, Object?> json) =>
      _$GenerationConfigFromJson(json);

  factory GenerationConfig.empty() => const GenerationConfig(stopSequences: []);
}

@freezed
class Settings with _$Settings {
  const Settings._();
  const factory Settings({
    required String apiKey,
    required List<SafetySetting> safetySettings,
    GenerationConfig? generationConfig,
  }) = _Settings;

  factory Settings.fromJson(Map<String, Object?> json) =>
      _$SettingsFromJson(json);

  factory Settings.empty() => const Settings(apiKey: "", safetySettings: []);

  Map<String, Object?> jsonSerialize() {
    var json = toJson();
    if (generationConfig != null &&
        generationConfig!.stopSequences.isEmpty &&
        generationConfig!.temperature == null &&
        generationConfig!.maxOutputTokens == null &&
        generationConfig!.topP == null &&
        generationConfig!.topK == null) {
      json.remove("generationConfig");
    }
    return json;
  }
}
