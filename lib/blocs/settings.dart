import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/models/settings.dart';

class SettingsCubit extends Cubit<Settings> {
  SettingsCubit(Settings settings) : super(settings);

  void setAPIKey(String apiKey) => emit(state.copyWith(apiKey: apiKey));

  void setHarassmentThreshold(Threshold threshold) => emit(state.copyWith(
      safetySettings:
          state.safetySettings.copyWith(harassmentThreshold: threshold)));

  void setHateSpeechThreshold(Threshold threshold) => emit(state.copyWith(
      safetySettings:
          state.safetySettings.copyWith(hateSpeechThreshold: threshold)));

  void setSexuallyExplicitThreshold(Threshold threshold) => emit(state.copyWith(
      safetySettings:
          state.safetySettings.copyWith(sexuallyExplicitThreshold: threshold)));

  void setDangerousThreshold(Threshold threshold) => emit(state.copyWith(
      safetySettings:
          state.safetySettings.copyWith(dangerousThreshold: threshold)));

  void addStopSequence(String s) => emit(state.copyWith(
      generationConfig: state.generationConfig.copyWith(
          stopSequences: [...state.generationConfig.stopSequences, s])));

  void removeStopSequence(int i) => emit(state.copyWith(
          generationConfig: state.generationConfig.copyWith(stopSequences: [
        ...state.generationConfig.stopSequences.sublist(0, i),
        ...state.generationConfig.stopSequences.sublist(i + 1)
      ])));

  void setTemperature(double temperature) => emit(state.copyWith(
      generationConfig:
          state.generationConfig.copyWith(temperature: temperature)));

  void setMaxOutputTokens(int maxOutputTokens) => emit(state.copyWith(
      generationConfig:
          state.generationConfig.copyWith(maxOutputTokens: maxOutputTokens)));

  void setTopP(double topP) => emit(state.copyWith(
      generationConfig: state.generationConfig.copyWith(topP: topP)));

  void setTopK(int topK) => emit(state.copyWith(
      generationConfig: state.generationConfig.copyWith(topK: topK)));
}
