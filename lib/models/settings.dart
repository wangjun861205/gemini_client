import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'settings.freezed.dart';
part 'settings.g.dart';

typedef HarmCategory = String;

const HarmCategory harmCategoryHarassment = "HARM_CATEGORY_HARASSMENT";
const HarmCategory harmCategoryHateSpeech = "HARM_CATEGORY_HATE_SPEECH";
const HarmCategory harmCategorySexuallyExplicit =
    "HARM_CATEGORY_SEXUALLY_EXPLICIT";
const HarmCategory harmCategoryDangerous = "HARM_CATEGORY_DANGEROUS_CONTENT";

typedef Threshold = String;

const Threshold blockNone = "BLOCK_NONE";
const Threshold blockOnlyHigh = "BLOCK_ONLY_HIGH";
const Threshold blockMediumAndAbove = "BLOCK_MEDIUM_AND_ABOVE";
const Threshold blockLowAndAbove = "BLOCK_LOW_AND_ABOVE";

class SafetySettings {
  final Threshold harassmentThreshold;
  final Threshold hateSpeechThreshold;
  final Threshold sexuallyExplicitThreshold;
  final Threshold dangerousThreshold;

  const SafetySettings({
    required this.harassmentThreshold,
    required this.hateSpeechThreshold,
    required this.sexuallyExplicitThreshold,
    required this.dangerousThreshold,
  });

  factory SafetySettings.default_() => const SafetySettings(
      harassmentThreshold: blockMediumAndAbove,
      hateSpeechThreshold: blockMediumAndAbove,
      sexuallyExplicitThreshold: blockMediumAndAbove,
      dangerousThreshold: blockMediumAndAbove);

  factory SafetySettings.fromJson(List<Map<String, Object?>> json) {
    Threshold harassmentThreshold = blockMediumAndAbove;
    Threshold hateSpeechThreshold = blockMediumAndAbove;
    Threshold sexuallyExplicitThreshold = blockMediumAndAbove;
    Threshold dangerousThreshold = blockMediumAndAbove;

    for (var item in json) {
      switch (item["category"]) {
        case harmCategoryHarassment:
          harassmentThreshold = item["threshold"] as Threshold;
          break;
        case harmCategoryHateSpeech:
          hateSpeechThreshold = item["threshold"] as Threshold;
          break;
        case harmCategorySexuallyExplicit:
          sexuallyExplicitThreshold = item["threshold"] as Threshold;
          break;
        default:
          dangerousThreshold = item["threshold"] as Threshold;
      }
    }

    return SafetySettings(
        harassmentThreshold: harassmentThreshold,
        hateSpeechThreshold: hateSpeechThreshold,
        sexuallyExplicitThreshold: sexuallyExplicitThreshold,
        dangerousThreshold: dangerousThreshold);
  }

  List<Map<String, Object?>> toJson() => [
        {
          "category": harmCategoryHarassment,
          "threshold": harassmentThreshold,
        },
        {
          "category": harmCategoryHateSpeech,
          "threshold": hateSpeechThreshold,
        },
        {
          "category": harmCategorySexuallyExplicit,
          "threshold": sexuallyExplicitThreshold,
        },
        {
          "category": harmCategoryDangerous,
          "threshold": dangerousThreshold,
        }
      ];

  SafetySettings copyWith({
    Threshold? harassmentThreshold,
    Threshold? hateSpeechThreshold,
    Threshold? sexuallyExplicitThreshold,
    Threshold? dangerousThreshold,
  }) {
    return SafetySettings(
        harassmentThreshold: harassmentThreshold ?? this.harassmentThreshold,
        hateSpeechThreshold: hateSpeechThreshold ?? this.hateSpeechThreshold,
        sexuallyExplicitThreshold:
            sexuallyExplicitThreshold ?? this.sexuallyExplicitThreshold,
        dangerousThreshold: dangerousThreshold ?? this.dangerousThreshold);
  }
}

@freezed
class GenerationConfig with _$GenerationConfig {
  const factory GenerationConfig({
    required List<String> stopSequences,
    required double temperature,
    required int maxOutputTokens,
    required double topP,
    required int topK,
  }) = _GenerationConfig;

  factory GenerationConfig.fromJson(Map<String, Object?> json) =>
      _$GenerationConfigFromJson(json);

  factory GenerationConfig.default_() => const GenerationConfig(
      temperature: 0.9,
      stopSequences: [],
      maxOutputTokens: 2048,
      topP: 1.0,
      topK: 1);
}

@freezed
class Settings with _$Settings {
  const Settings._();
  const factory Settings({
    required String apiKey,
    required SafetySettings safetySettings,
    required GenerationConfig generationConfig,
  }) = _Settings;

  factory Settings.fromJson(Map<String, Object?> json) =>
      _$SettingsFromJson(json);

  factory Settings.default_() => Settings(
      apiKey: "",
      safetySettings: SafetySettings.default_(),
      generationConfig: GenerationConfig.default_());
}
