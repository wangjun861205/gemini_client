import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/apis.dart';
import 'package:gemini_client/blocs/conversation.dart';
import 'package:gemini_client/blocs/model.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:image_picker/image_picker.dart';

class _ModelSwitchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = BlocProvider.of<ModelCubit>(context, listen: true);
    final content = BlocProvider.of<ContentCubit>(context, listen: true);
    return Container(
      width: 150,
      height: 40,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 1, color: Colors.grey)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: () async {
          if (content.state.parts.whereType<InlineDataPart>().isNotEmpty &&
              model.state == "gemini-pro-vision") {
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: const Text("Switching Is Disabled"),
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Text(
                            "There are some inline-part(e.g images) data in your input content, if you want to switch to Gemini-Pro, please remove these data"),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Ok"))
                      ]);
                });
            return;
          }
          model.state == "gemini-pro"
              ? model.switchToGeminiProVision()
              : model.switchToGeminiPro();
        },
        child: Align(
            child: Text(model.state == "gemini-pro"
                ? "Gemini-Pro"
                : "Gemini-Pro-Vision")),
      ),
    );
  }
}

class _PickImageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final content = BlocProvider.of<ContentCubit>(context, listen: true);

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

    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: pickImage,
          child: const Padding(
              padding: EdgeInsets.all(5), child: Icon(size: 30, Icons.image)),
        ));
  }
}

class _AddButton extends StatelessWidget {
  final TextEditingController textCtrl;

  const _AddButton({required this.textCtrl});

  @override
  Widget build(BuildContext context) {
    final content = BlocProvider.of<ContentCubit>(context, listen: true);

    void onAdd() async {
      if (textCtrl.text.isEmpty) {
        return;
      }
      content.pushPart(TextPart(text: textCtrl.text));
      textCtrl.clear();
    }

    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: onAdd,
          child: const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(size: 30, Icons.plus_one)),
        ));
  }
}

class _SendButton extends StatelessWidget {
  final TextEditingController textCtrl;

  const _SendButton({required this.textCtrl});

  @override
  Widget build(BuildContext context) {
    final content = BlocProvider.of<ContentCubit>(context, listen: true);
    final settings = BlocProvider.of<SettingsCubit>(context, listen: true);
    final history = BlocProvider.of<ContentsCubit>(context, listen: true);
    final model = BlocProvider.of<ModelCubit>(context, listen: true);

    void onSend() async {
      if (content.state.parts.isEmpty && textCtrl.text.isEmpty) {
        return;
      }
      if (textCtrl.text.isNotEmpty) {
        content.pushPart(TextPart(text: textCtrl.text));
        textCtrl.clear();
      }
      history.pushContent(content.state);
      content.setParts([]);
      debugPrint("${history.state}");
      final resp = await generateContent(
          model: model.state,
          settings: settings.state,
          contents: history.state);
      history.pushContent(resp);
    }

    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
        child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            onTap: onSend,
            child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(size: 30, Icons.send))));
  }
}

class MultipartsInputGroup extends StatelessWidget {
  const MultipartsInputGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final model = BlocProvider.of<ModelCubit>(context, listen: true);
    final textCtrl = TextEditingController(text: "");

    return TextField(
        decoration: InputDecoration(
            prefixIcon: _ModelSwitchButton(),
            suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (model.state == "gemini-pro-vision")
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: _PickImageButton()),
                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: _AddButton(
                        textCtrl: textCtrl,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: _SendButton(textCtrl: textCtrl),
                  )
                ]),
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.grey),
                borderRadius: BorderRadius.circular(50))),
        controller: textCtrl,
        maxLines: null);
  }
}
