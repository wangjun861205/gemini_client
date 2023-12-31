import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:gemini_client/components/generation_config_group.dart';
import 'package:gemini_client/components/safety_settings_group.dart';
import 'package:gemini_client/screens/home.dart';
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
    final settings = BlocProvider.of<SettingsCubit>(context, listen: true);

    final apiKeyController = TextEditingController(text: settings.state.apiKey);
    return Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: SingleChildScrollView(
            child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Row(children: [
                                const Expanded(flex: 3, child: Text("API Key")),
                                Expanded(
                                    flex: 7,
                                    child: TextField(
                                        controller: apiKeyController,
                                        onChanged: (value) =>
                                            settings.setAPIKey(value))),
                              ])),
                          Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: SafetySettingsGroup()),
                          Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: GenerationConfigGroup()),
                          TextButton(
                              onPressed: () {
                                SharedPreferences.getInstance().then((prefs) {
                                  prefs.setString(
                                      "settings", jsonEncode(settings.state));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => BlocProvider.value(
                                          value: settings,
                                          child: const HomeScreen())));
                                });
                              },
                              child: const Text("Save"))
                        ])))));
  }
}
