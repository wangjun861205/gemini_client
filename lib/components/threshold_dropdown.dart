import 'package:flutter/material.dart';
import 'package:gemini_client/models/settings.dart';
import '../models/settings.dart' as settings;

class ThresholdDropdown extends StatelessWidget {
  final settings.Threshold value;
  final void Function(settings.Threshold value) onChange;

  const ThresholdDropdown(
      {required this.value, required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      items: const [
        DropdownMenuItem(value: blockNone, child: Text("Block none")),
        DropdownMenuItem(value: blockOnlyHigh, child: Text("Block only high")),
        DropdownMenuItem(
            value: blockMediumAndAbove, child: Text("Block medium and above")),
        DropdownMenuItem(
            value: blockLowAndAbove, child: Text("Block low and above")),
      ],
      onChanged: (val) {
        if (val != null) {
          onChange(val);
        }
      },
    );
  }
}
