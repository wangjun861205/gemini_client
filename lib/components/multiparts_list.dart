import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/apis.dart';
import 'package:gemini_client/blocs/conversation.dart';

class MultipartsList extends StatelessWidget {
  const MultipartsList({super.key});

  @override
  Widget build(BuildContext context) {
    final content = BlocProvider.of<ContentCubit>(context, listen: true);
    return ReorderableListView(
        scrollDirection: Axis.horizontal,
        children: content.state.parts.indexed
            .map((p) => SizedBox(
                key: UniqueKey(),
                width: 200,
                child: p.$2 is TextPart
                    ? Card(
                        color: Colors.cyan[100],
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Stack(children: [
                              Align(
                                child: Text(
                                  (p.$2 as TextPart).text,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: InkWell(
                                      onTap: () => content.removePart(p.$1),
                                      child: const Icon(Icons.close)))
                            ])))
                    : Stack(children: [
                        Image.memory(
                          base64Decode(
                              (p.$2 as InlineDataPart).inlineData.data),
                          width: 200,
                          height: 100,
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: InkWell(
                                onTap: () => content.removePart(p.$1),
                                child: const Icon(Icons.close)))
                      ])))
            .toList(),
        onReorder: (oldIdx, newIdx) {
          var parts = [...content.state.parts];
          final part = parts.removeAt(oldIdx);
          if (oldIdx >= newIdx) {
            parts.insert(newIdx, part);
          } else {
            parts.insert(newIdx - 1, part);
          }
          content.setParts(parts);
        });
  }
}
