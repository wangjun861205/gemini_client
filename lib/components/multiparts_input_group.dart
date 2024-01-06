import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/apis.dart';
import 'package:gemini_client/blocs/conversation.dart';
import 'package:gemini_client/blocs/model.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class _ModelSwitchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = BlocProvider.of<ModelCubit>(context, listen: true);
    final content = BlocProvider.of<ContentCubit>(context, listen: true);
    final history = BlocProvider.of<HistoryCubit>(context, listen: true);
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.07,
      height: screenWidth * 0.07,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
      child: InkWell(
        customBorder: const CircleBorder(),
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
          history.setValidCount(0);
          model.state == "gemini-pro"
              ? model.switchToGeminiProVision()
              : model.switchToGeminiPro();
        },
        child: Align(
            child: Text(model.state == "gemini-pro" ? "P" : "V",
                style: const TextStyle(
                    fontSize: 12, height: 0.5, fontWeight: FontWeight.bold))),
      ),
    );
  }
}

class _PickImageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final content = BlocProvider.of<ContentCubit>(context, listen: true);

    void pickImage() async {
      final status = await [Permission.photos, Permission.camera].request();
      final photosStatus = status[Permission.photos];
      final cameraStatus = status[Permission.camera];
      if (photosStatus == null ||
          photosStatus.isDenied ||
          photosStatus.isPermanentlyDenied ||
          photosStatus.isRestricted ||
          cameraStatus == null ||
          cameraStatus.isDenied ||
          cameraStatus.isPermanentlyDenied ||
          cameraStatus.isRestricted) {
        return;
      }
      final picker = ImagePicker();
      final file = await picker.pickImage(source: ImageSource.camera);
      if (file == null) {
        return;
      }
      final part = InlineDataPart(
          inlineData: InlineData(
              mimeType: file.mimeType ?? "image/png",
              data: base64Encode(await file.readAsBytes())));
      content.pushPart(part);
    }

    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
      child: InkWell(
          customBorder: const CircleBorder(),
          // borderRadius: BorderRadius.all(
          //     Radius.circular(MediaQuery.of(context).size.width * 0.025)),
          onTap: pickImage,
          child: Icon(
              size: MediaQuery.of(context).size.width * 0.07, Icons.image)),
    );
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
          customBorder: const CircleBorder(),
          // borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: onAdd,
          child: Icon(
              size: MediaQuery.of(context).size.width * 0.07, Icons.plus_one)),
    );
  }
}

class _SendButton extends StatelessWidget {
  final TextEditingController textCtrl;

  const _SendButton({required this.textCtrl});

  @override
  Widget build(BuildContext context) {
    final content = BlocProvider.of<ContentCubit>(context, listen: true);
    final settings = BlocProvider.of<SettingsCubit>(context, listen: true);
    final history = BlocProvider.of<HistoryCubit>(context, listen: true);
    final model = BlocProvider.of<ModelCubit>(context, listen: true);

    String? validateContent() {
      if (model.state == "gemini-pro-vision" &&
          content.state.parts.whereType<InlineDataPart>().isEmpty) {
        return "Add an image to use models/gemini-pro-vision, or switch your model to a text model.";
      }
      if (model.state == "gemini-pro" &&
          (content.state.parts.whereType<InlineDataPart>().isNotEmpty ||
              history.state.contents
                  .sublist(
                      history.state.contents.length - history.state.validCount)
                  .where((c) => c.parts.whereType<InlineDataPart>().isNotEmpty)
                  .isNotEmpty)) {
        return "gemini-pro model not support image";
      }
      return null;
    }

    void showWarningDialog(String content) async {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Warning"),
                content: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    child: Text(content)),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Ok"))
                ],
              ));
    }

    void onSend() async {
      if (content.state.parts.isEmpty && textCtrl.text.isEmpty) {
        return;
      }
      if (textCtrl.text.isNotEmpty) {
        content.pushPart(TextPart(text: textCtrl.text));
        textCtrl.clear();
      }
      final err = validateContent();
      if (err != null) {
        showWarningDialog(err);
        return;
      }
      history.pushContent(content.state);
      history.setValidCount(history.state.validCount + 1);
      content.setParts([]);
      final resp = await generateContent(
          model: model.state,
          settings: settings.state,
          contents: history.state.contents.sublist(
              history.state.contents.length - history.state.validCount));
      history.pushContent(resp);
    }

    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
        child: InkWell(
            // borderRadius: BorderRadius.all(
            //     Radius.circular(MediaQuery.of(context).size.width * 0.025)),
            customBorder: const CircleBorder(),
            onTap: onSend,
            child: Icon(
                size: MediaQuery.of(context).size.width * 0.07, Icons.send)));
  }
}

class MultipartsInputGroup extends StatelessWidget {
  const MultipartsInputGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final model = BlocProvider.of<ModelCubit>(context, listen: true);
    final textCtrl = TextEditingController(text: "");
    final screenWidth = MediaQuery.of(context).size.width;

    return TextField(
        style: const TextStyle(fontSize: 16, height: 1),
        decoration: InputDecoration(
            prefixIcon: _ModelSwitchButton(),
            suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (model.state == "gemini-pro-vision")
                    Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.01,
                            right: screenWidth * 0.01),
                        child: _PickImageButton()),
                  Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.01, right: screenWidth * 0.01),
                      child: _AddButton(
                        textCtrl: textCtrl,
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.01, right: screenWidth * 0.02),
                    child: _SendButton(textCtrl: textCtrl),
                  )
                ]),
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.grey),
                borderRadius: BorderRadius.circular(screenWidth * 0.1))),
        controller: textCtrl,
        maxLines: null);
  }
}
