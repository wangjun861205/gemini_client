import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';

class TemperatureRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context, listen: true);

    return Row(children: [
      const Expanded(flex: 3, child: Text("Temperature: ")),
      Expanded(
          flex: 2,
          child: Text(settings.state.generationConfig.temperature.toString())),
      Expanded(
        flex: 5,
        child: Slider(
          divisions: 10,
          value: settings.state.generationConfig.temperature,
          onChanged: (val) => settings.setTemperature(val),
        ),
      )
    ]);
  }
}
