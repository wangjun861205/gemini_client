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
        children: content.state.parts.indexed
            .map((p) => ListTile(
                key: UniqueKey(),
                title: p.$2 is TextPart
                    ? Text((p.$2 as TextPart).text)
                    : Image.memory(
                        base64Decode((p.$2 as InlineDataPart).inlineData.data),
                        width: 100,
                        height: 100,
                      ),
                trailing: TextButton(
                    onPressed: () => content.removePart(p.$1),
                    child: const Text("Remove"))))
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
