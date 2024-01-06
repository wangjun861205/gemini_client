import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';

class APIKeyInputRow extends StatelessWidget {
  final TextEditingController textCtrl;
  const APIKeyInputRow({required this.textCtrl, super.key});
  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context);
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Expanded(flex: 3, child: Text("API Key")),
      Expanded(
          flex: 7,
          child: TextField(
              controller: textCtrl,
              onChanged: (value) => settings.setAPIKey(value))),
    ]);
  }
}
