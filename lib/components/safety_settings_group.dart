import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:gemini_client/components/threshold_dropdown.dart';

class IsSafetySettingsOpenCubit extends Cubit<bool> {
  IsSafetySettingsOpenCubit(bool isOpen) : super(isOpen);

  void set(bool isOpen) => emit(isOpen);
}

class SafetySettingsGroup extends StatelessWidget {
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
                Column(children: [
                  Row(children: [
                    const Expanded(
                        flex: 5, child: Text("Harassment Threshold: ")),
                    Expanded(
                        flex: 5,
                        child: ThresholdDropdown(
                            value: settings
                                .state.safetySettings.harassmentThreshold,
                            onChange: (val) =>
                                settings.setHarassmentThreshold(val)))
                  ]),
                  Row(children: [
                    const Expanded(
                        flex: 5, child: Text("Hate Speech Threshold: ")),
                    Expanded(
                        flex: 5,
                        child: ThresholdDropdown(
                            value: settings
                                .state.safetySettings.hateSpeechThreshold,
                            onChange: (val) =>
                                settings.setHateSpeechThreshold(val)))
                  ]),
                  Row(children: [
                    const Expanded(
                        flex: 5, child: Text("Sexually Explicit Threshold: ")),
                    Expanded(
                        flex: 5,
                        child: ThresholdDropdown(
                            value: settings
                                .state.safetySettings.sexuallyExplicitThreshold,
                            onChange: (val) =>
                                settings.setSexuallyExplicitThreshold(val)))
                  ]),
                  Row(children: [
                    const Expanded(
                        flex: 5, child: Text("Dangerous Threshold: ")),
                    Expanded(
                        flex: 5,
                        child: ThresholdDropdown(
                            value: settings
                                .state.safetySettings.dangerousThreshold,
                            onChange: (val) =>
                                settings.setDangerousThreshold(val)))
                  ])
                ])
            ],
          );
        }));
  }
}
