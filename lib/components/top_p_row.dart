import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';

class TopPRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context, listen: true);

    return Row(
      children: [
        const Expanded(flex: 3, child: Text("Top P:")),
        Expanded(
            flex: 2,
            child: Text(settings.state.generationConfig.topP.toString())),
        Expanded(
          flex: 5,
          child: Slider(
            divisions: 20,
            value: settings.state.generationConfig.topP,
            onChanged: (val) => settings.setTopP(val),
          ),
        ),
      ],
    );
  }
}
