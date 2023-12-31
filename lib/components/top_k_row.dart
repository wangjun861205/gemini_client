import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';

class TopKRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context, listen: true);
    return Row(
      children: [
        const Expanded(
          flex: 3,
          child: Text("Top K"),
        ),
        Expanded(
            flex: 7,
            child: TextField(
                keyboardType: TextInputType.number,
                controller: TextEditingController(
                    text: settings.state.generationConfig.topK.toString()))),
      ],
    );
  }
}
