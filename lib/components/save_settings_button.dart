import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:gemini_client/models/settings.dart';
import 'package:gemini_client/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveSettingsButton extends StatelessWidget {
  const SaveSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context);
    return TextButton(
        onPressed: () async {
          if (settings.state.apiKey.isEmpty) {
            await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        title: const Text("API Key"),
                        content: ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxWidth: 500, minWidth: 300),
                            child: const Text(
                                "API key is required, please enter")),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Ok"))
                        ]));
            return;
          }
          SharedPreferences.getInstance().then((prefs) {
            prefs.setString("settings", jsonEncode(settings.state));
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                    value: settings, child: const HomeScreen())));
          });
        },
        child: const Text("Save"));
  }
}
