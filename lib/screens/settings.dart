import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:gemini_client/models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingScreenState();
  }
}

class SettingScreenState extends State<SettingsScreen> {
  bool isSafetySettingsOpen = false;
  bool isGenerationConfigOpen = false;
  SettingScreenState() : super();

  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context);

    final apiKeyController = TextEditingController(text: settings.state.apiKey);
    return Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Align(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                  controller: apiKeyController,
                  onChanged: (value) => settings.setAPIKey(value)),
            ),
          ),
          Switch(
              value: isSafetySettingsOpen,
              onChanged: (value) =>
                  setState(() => isSafetySettingsOpen = value)),
          if (isSafetySettingsOpen)
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(children: [
                  const Expanded(child: TextField()),
                  const Expanded(child: TextField()),
                  FloatingActionButton(onPressed: () {})
                ])),
          Switch(
              value: isGenerationConfigOpen,
              onChanged: (value) =>
                  setState(() => isGenerationConfigOpen = value)),
          if (isGenerationConfigOpen)
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(children: [
                  Row(children: [
                    const Expanded(child: TextField()),
                    FloatingActionButton(onPressed: () {})
                  ]),
                  const TextField(),
                  const TextField(),
                  const TextField(),
                  const TextField(),
                ])),
          Align(
              child: TextButton(
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString(
                        "settings", jsonEncode(settings.state.jsonSerialize()));
                  },
                  child: const Text("Save")))
        ]));
  }
}
