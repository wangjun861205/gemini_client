import "dart:convert";
import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:gemini_client/models/settings.dart";
import "package:http/http.dart";
part "apis.freezed.dart";
part "apis.g.dart";

abstract class Part {
  const Part();

  factory Part.fromJson(Map<String, Object?> json) {
    if (json["text"] != null) {
      return TextPart.fromJson(json);
    }
    return InlineDataPart.fromJson(json);
  }

  Map<String, Object?> toJson() {
    if (this is TextPart) {
      return (this as TextPart).toJson();
    }
    return (this as InlineDataPart).toJson();
  }
}

class TextPart extends Part {
  final String text;
  TextPart({required this.text}) : super();

  factory TextPart.fromJson(Map<String, Object?> json) =>
      TextPart(text: json["text"] as String);

  @override
  Map<String, Object?> toJson() => {"text": text};
}

class InlineData {
  final String mimeType;
  final String data;
  const InlineData({
    required this.mimeType,
    required this.data,
  });

  factory InlineData.fromJson(Map<String, Object?> json) => InlineData(
      mimeType: json["mime_type"] as String, data: json["data"] as String);

  Map<String, Object?> toJson() => {"mime_type": mimeType, "data": data};
}

class InlineDataPart extends Part {
  final InlineData inlineData;
  InlineDataPart({required this.inlineData});

  factory InlineDataPart.fromJson(Map<String, Object?> json) => InlineDataPart(
      inlineData:
          InlineData.fromJson(json["inline_data"] as Map<String, Object?>));

  @override
  Map<String, Object?> toJson() => {"inline_data": inlineData.toJson()};
}

@freezed
class Content with _$Content {
  const factory Content({
    required List<Part> parts,
    String? role,
  }) = _Content;

  factory Content.fromJson(Map<String, Object?> json) =>
      _$ContentFromJson(json);

  factory Content.user() => const Content(parts: [], role: "user");
}

class GenerateContentRequest {
  final List<Content> contents;
  final SafetySettings safetySettings;
  final GenerationConfig? generationConfig;

  const GenerateContentRequest({
    required this.contents,
    required this.safetySettings,
    this.generationConfig,
  });

  factory GenerateContentRequest.fromJson(Map<String, Object?> json) =>
      GenerateContentRequest(
          contents: (json["contents"] as List<Map<String, Object?>>)
              .map((c) => Content.fromJson(c))
              .toList(),
          safetySettings: SafetySettings.fromJson(
              json["safetySettings"] as List<Map<String, Object?>>),
          generationConfig: json["generationConfig"] == null
              ? null
              : GenerationConfig.fromJson(json));

  Map<String, Object?> toJson() {
    Map<String, Object?> m = {
      "contents": contents.map((c) => c.toJson()).toList(),
      "safetySettings": safetySettings.toJson(),
    };
    if (generationConfig != null) {
      m["generationConfig"] = generationConfig!.toJson();
    }
    return m;
  }
}

@freezed
class SafetyRating with _$SafetyRating {
  const factory SafetyRating({
    required String category,
    required String probability,
  }) = _SafetyRating;

  factory SafetyRating.fromJson(Map<String, Object?> json) =>
      _$SafetyRatingFromJson(json);
}

@freezed
class Candidate with _$Candidate {
  const factory Candidate(
      {required Content content,
      required String finishReason,
      required int index,
      required List<SafetyRating> safetyRatings}) = _Candidate;

  factory Candidate.fromJson(Map<String, Object?> json) =>
      _$CandidateFromJson(json);
}

@freezed
class PromptFeedback with _$PromptFeedback {
  const factory PromptFeedback({required List<SafetyRating> safetyRatings}) =
      _PromptFeedback;

  factory PromptFeedback.fromJson(Map<String, Object?> json) =>
      _$PromptFeedbackFromJson(json);
}

@freezed
class GenerateContentResponse with _$GenerateContentResponse {
  const factory GenerateContentResponse(
      {required List<Candidate> candidates,
      required PromptFeedback promptFeedback}) = _GenerateContentResponse;

  factory GenerateContentResponse.fromJson(Map<String, Object?> json) =>
      _$GenerateContentResponseFromJson(json);
}

// Future<Content> generateContentSingleText(
//     {required String apiKey, required String text}) async {
//   final url = Uri.parse(
//       "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey");
//   final resp = await post(url,
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(GenerateContentRequest(contents: [
//         Content(parts: [TextPart(text: text)])
//       ])));
//   if (resp.statusCode != 200) {
//     throw Exception("Failed to generate content: ${resp.body}");
//   }
//   final Map<String, Object?> json = jsonDecode(resp.body);
//   final data = GenerateContentResponse.fromJson(json);
//   return data.candidates[0].content;
// }

Future<Content> generateContent(
    {required String model,
    required Settings settings,
    required List<Content> contents}) async {
  final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent?key=${settings.apiKey}");
  final resp = await post(url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(GenerateContentRequest(
          contents: contents,
          safetySettings: settings.safetySettings,
          generationConfig: settings.generationConfig)));
  if (resp.statusCode != 200) {
    throw Exception("Failed to generate content: ${resp.body}");
  }
  final Map<String, Object?> json = jsonDecode(resp.body);
  final data = GenerateContentResponse.fromJson(json);
  return data.candidates[0].content;
}
