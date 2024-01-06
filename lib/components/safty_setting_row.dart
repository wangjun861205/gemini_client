import 'package:flutter/material.dart';
import 'package:gemini_client/components/threshold_dropdown.dart';

class SafetySettingRow extends StatelessWidget {
  final String label;
  final String value;
  final void Function(String value) onChange;
  const SafetySettingRow(
      {required this.label,
      required this.value,
      required this.onChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(flex: 3, child: Text(label)),
      Expanded(
          flex: 7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ThresholdDropdown(value: value, onChange: onChange)],
          ))
    ]);
  }
}
