// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentImpl _$$ContentImplFromJson(Map<String, dynamic> json) =>
    _$ContentImpl(
      parts: (json['parts'] as List<dynamic>)
          .map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$ContentImplToJson(_$ContentImpl instance) =>
    <String, dynamic>{
      'parts': instance.parts,
      'role': instance.role,
    };

_$SafetyRatingImpl _$$SafetyRatingImplFromJson(Map<String, dynamic> json) =>
    _$SafetyRatingImpl(
      category: json['category'] as String,
      probability: json['probability'] as String,
    );

Map<String, dynamic> _$$SafetyRatingImplToJson(_$SafetyRatingImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'probability': instance.probability,
    };

_$CandidateImpl _$$CandidateImplFromJson(Map<String, dynamic> json) =>
    _$CandidateImpl(
      content: Content.fromJson(json['content'] as Map<String, dynamic>),
      finishReason: json['finishReason'] as String,
      index: json['index'] as int,
      safetyRatings: (json['safetyRatings'] as List<dynamic>)
          .map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CandidateImplToJson(_$CandidateImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'finishReason': instance.finishReason,
      'index': instance.index,
      'safetyRatings': instance.safetyRatings,
    };

_$PromptFeedbackImpl _$$PromptFeedbackImplFromJson(Map<String, dynamic> json) =>
    _$PromptFeedbackImpl(
      safetyRatings: (json['safetyRatings'] as List<dynamic>)
          .map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PromptFeedbackImplToJson(
        _$PromptFeedbackImpl instance) =>
    <String, dynamic>{
      'safetyRatings': instance.safetyRatings,
    };

_$GenerateContentResponseImpl _$$GenerateContentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateContentResponseImpl(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      promptFeedback: PromptFeedback.fromJson(
          json['promptFeedback'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GenerateContentResponseImplToJson(
        _$GenerateContentResponseImpl instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
      'promptFeedback': instance.promptFeedback,
    };
