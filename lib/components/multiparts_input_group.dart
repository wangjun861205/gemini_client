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

    void add() async {
      content.pushPart(TextPart(text: textCtrl.text));
      textCtrl.clear();
    }

    void send() async {
      history.pushContent(content.state);
      content.setParts([]);
      final resp = await generateContent(
          model: model.state,
          settings: settings.state,
          contents: history.state);
      history.pushContent(resp);
    }

    void pickImage() async {
      final picker = ImagePicker();
      final file = await picker.pickImage(source: ImageSource.gallery);
      if (file == null) {
        return;
      }
      final part = InlineDataPart(
          inlineData: InlineData(
              mimeType: file.mimeType ?? "",
              data: base64Encode(await file.readAsBytes())));
      content.pushPart(part);
    }

    return TextField(
        decoration: InputDecoration(
            prefixIcon: InkWell(
              onTap: () => model.state == "gemini-pro"
                  ? model.switchToGeminiProVision()
                  : model.switchToGeminiPro(),
              child: Container(
                width: 150,
                height: 40,
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: Align(
                    child: Text(model.state == "gemini-pro"
                        ? "Gemini-Pro"
                        : "Gemini-Pro-Vision")),
              ),
            ),
            suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (model.state == "gemini-pro-vision")
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                            onTap: pickImage,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey)),
                              child: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(size: 30, Icons.image)),
                            ))),
                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: InkWell(
                          onTap: add,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(size: 30, Icons.plus_one)),
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: InkWell(
                        onTap: send,
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: InkWell(
                                    child: Icon(size: 30, Icons.send))))),
                  )
                ]),
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.grey),
                borderRadius: BorderRadius.circular(50))),
        controller: textCtrl,
        maxLines: null);
  }
}
