import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/models/settings.dart';

class SettingsCubit extends Cubit<Settings> {
  SettingsCubit(Settings settings) : super(settings);

  void setAPIKey(String apiKey) => emit(state.copyWith(apiKey: apiKey));

  void addSafetySetting(SafetySetting setting) =>
      emit(state.copyWith(safetySettings: [...state.safetySettings, setting]));

  void removeSafetySetting(SafetySetting setting) => emit(state.copyWith(
      safetySettings: state.safetySettings
          .where((s) => s.category != setting.category)
          .toList()));

  void addStopSequences(String s) => emit(state.copyWith(
          generationConfig: (state.generationConfig ?? GenerationConfig.empty())
              .copyWith(stopSequences: [
        ...(state.generationConfig ?? GenerationConfig.empty()).stopSequences,
        s
      ])));

  void removeStopSequences(String s) => emit(state.copyWith(
      generationConfig: (state.generationConfig ?? GenerationConfig.empty())
          .copyWith(
              stopSequences:
                  (state.generationConfig ?? GenerationConfig.empty())
                      .stopSequences
                      .where((sign) => sign != s)
                      .toList())));

  void setTemperature(double? temperature) => emit(state.copyWith(
      generationConfig: (state.generationConfig ?? GenerationConfig.empty())
          .copyWith(temperature: temperature)));

  void setMaxOutputTokens(int? maxOutputTokens) => emit(state.copyWith(
      generationConfig: (state.generationConfig ?? GenerationConfig.empty())
          .copyWith(maxOutputTokens: maxOutputTokens)));

  void setTopP(double? topP) => emit(state.copyWith(
      generationConfig: (state.generationConfig ?? GenerationConfig.empty())
          .copyWith(topP: topP)));

  void setTopK(int? topK) => emit(state.copyWith(
      generationConfig: (state.generationConfig ?? GenerationConfig.empty())
          .copyWith(topK: topK)));
}
