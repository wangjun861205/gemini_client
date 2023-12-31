import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';

class StopSequencesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context, listen: true);
    final ctrl = TextEditingController(text: "");

    return Column(children: [
      Row(
        children: settings.state.generationConfig.stopSequences.indexed
            .map(
              (s) => Card(
                  color: Colors.cyan[100],
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(children: [
                        Text(s.$2),
                        Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: InkWell(
                              onTap: () => settings.removeStopSequence(s.$1),
                              child: const Icon(Icons.close),
                            ))
                      ]))),
            )
            .toList(),
      ),
      Row(
        children: [
          const Expanded(flex: 3, child: Text("Stop Sequence")),
          Expanded(flex: 6, child: TextField(controller: ctrl)),
          Expanded(
              flex: 1,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                child: const Icon(Icons.plus_one),
                onPressed: () => {settings.addStopSequence(ctrl.text)},
              ))
        ],
      )
    ]);
  }
}
