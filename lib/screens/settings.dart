import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:gemini_client/components/api_key_input_row.dart';
import 'package:gemini_client/components/generation_config_group.dart';
import 'package:gemini_client/components/safety_settings_group.dart';
import 'package:gemini_client/components/save_settings_button.dart';
import 'package:gemini_client/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
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
        appBar: AppBar(
          title: const Text("Settings"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child:
                                  APIKeyInputRow(textCtrl: apiKeyController)),
                          Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: const SafetySettingsGroup()),
                          Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: const GenerationConfigGroup()),
                          Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [SaveSettingsButton()]))
                        ])))));
  }
}
