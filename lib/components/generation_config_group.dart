import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:gemini_client/components/max_output_tokens_row.dart';
import 'package:gemini_client/components/stop_sequences_row.dart';
import 'package:gemini_client/components/temperature_row.dart';
import 'package:gemini_client/components/top_k_row.dart';
import 'package:gemini_client/components/top_p_row.dart';

class IsOpenCubit extends Cubit<bool> {
  IsOpenCubit(bool isOpen) : super(isOpen);

  void set(bool isOpen) => emit(isOpen);
}

class GenerationConfigGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context, listen: true);

    return BlocProvider(
        create: (_) => IsOpenCubit(false),
        child: Builder(builder: (context) {
          final isOpen = BlocProvider.of<IsOpenCubit>(context, listen: true);
          return Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Text("Generation Config"),
                Switch(
                    value: isOpen.state,
                    onChanged: (value) => isOpen.set(value)),
              ]),
              if (isOpen.state)
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 30),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: StopSequencesRow()),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: TemperatureRow(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: MaxOutputTokensRow(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: TopKRow(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: TopPRow(),
                        )
                      ])),
                )
            ],
          );
        }));
  }
}
