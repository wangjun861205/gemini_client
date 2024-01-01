import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/apis.dart';
import 'package:gemini_client/blocs/conversation.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    final contents = BlocProvider.of<ContentsCubit>(context, listen: true);
    final scrollCtrl = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollCtrl.animateTo(scrollCtrl.position.maxScrollExtent,
          duration: const Duration(
            milliseconds: 500,
          ),
          curve: Curves.linear);
    });
    return ListView.builder(
        controller: scrollCtrl,
        itemCount: contents.state.length,
        itemBuilder: (context, i) => Column(
              children: [
                ...contents.state[i].parts
                    .map((p) => Align(
                        alignment: contents.state[i].role == "model"
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Card(
                            color: contents.state[i].role == "model"
                                ? Colors.white
                                : Colors.blue[300],
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: p is TextPart
                                    ? MarkdownBody(data: p.text)
                                    : Image.memory(base64Decode(
                                        (p as InlineDataPart)
                                            .inlineData
                                            .data))))))
                    .toList()
              ],
            ));
  }
}
