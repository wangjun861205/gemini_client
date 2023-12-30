import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/apis.dart';
import 'package:gemini_client/blocs/conversation.dart';
import 'package:gemini_client/blocs/model.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:image_picker/image_picker.dart';

class MultipartsInputGroup extends StatelessWidget {
  const MultipartsInputGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context, listen: true);
    final history = BlocProvider.of<ContentsCubit>(context, listen: true);
    final content = BlocProvider.of<ContentCubit>(context, listen: true);
    final model = BlocProvider.of<ModelCubit>(context, listen: true);
    final textCtrl = TextEditingController(text: "");

    return Row(children: [
      Expanded(flex: 6, child: TextField(controller: textCtrl, maxLines: 10)),
      Expanded(
          flex: 4,
          child: Column(children: [
            DropdownButton(
                value: model.state,
                items: const [
                  DropdownMenuItem(
                      value: "gemini-pro", child: Text("Gemini-Pro")),
                  DropdownMenuItem(
                      value: "gemini-pro-vision",
                      child: Text("Gemini-Pro-Vision")),
                ],
                onChanged: (value) => value == "gemini-pro"
                    ? model.switchToGeminiPro()
                    : model.switchToGeminiProVision()),
            TextButton(
                onPressed: () {
                  content.pushPart(TextPart(text: textCtrl.text));
                  textCtrl.clear();
                },
                child: const Text("Add")),
            if (model.state == "gemini-pro-vision")
              TextButton(
                  onPressed: () async {
                    final picker = ImagePicker();
                    final file =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (file == null) {
                      return;
                    }
                    final part = InlineDataPart(
                        inlineData: InlineData(
                            mimeType: file.mimeType ?? "",
                            data: base64Encode(await file.readAsBytes())));
                    content.pushPart(part);
                  },
                  child: const Text("Pick Image")),
            TextButton(
                onPressed: () async {
                  history.pushContent(content.state);
                  content.setParts([]);
                  final resp = await generateContent(
                      model: model.state,
                      apiKey: settings.state.apiKey,
                      contents: history.state);
                  history.pushContent(resp);
                },
                child: const Text("Send"))
          ]))
    ]);
  }
}
