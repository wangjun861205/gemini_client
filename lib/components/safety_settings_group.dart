import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:gemini_client/components/safty_setting_row.dart';

class IsSafetySettingsOpenCubit extends Cubit<bool> {
  IsSafetySettingsOpenCubit(bool isOpen) : super(isOpen);

  void set(bool isOpen) => emit(isOpen);
}

class SafetySettingsGroup extends StatelessWidget {
  const SafetySettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context, listen: true);
    return BlocProvider(
        create: (_) => IsSafetySettingsOpenCubit(false),
        child: Builder(builder: (context) {
          final isOpen =
              BlocProvider.of<IsSafetySettingsOpenCubit>(context, listen: true);
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Safety Settings"),
                  Switch(
                      value: isOpen.state, onChanged: (val) => isOpen.set(val)),
                ],
              ),
              if (isOpen.state)
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(children: [
                      SafetySettingRow(
                          label: "Harassment Threshold:",
                          value:
                              settings.state.safetySettings.harassmentThreshold,
                          onChange: (val) =>
                              settings.setHarassmentThreshold(val)),
                      SafetySettingRow(
                          label: "Hate Speech Threshold:",
                          value:
                              settings.state.safetySettings.hateSpeechThreshold,
                          onChange: (val) =>
                              settings.setHateSpeechThreshold(val)),
                      SafetySettingRow(
                          label: "Sexually Explicit Threshold:",
                          value: settings
                              .state.safetySettings.sexuallyExplicitThreshold,
                          onChange: (val) =>
                              settings.setSexuallyExplicitThreshold(val)),
                      SafetySettingRow(
                          label: "Dangerous Threshold:",
                          value:
                              settings.state.safetySettings.dangerousThreshold,
                          onChange: (val) =>
                              settings.setDangerousThreshold(val)),
                    ]))
            ],
          );
        }));
  }
}
