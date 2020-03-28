import 'package:flutter/material.dart';
import 'package:huffmancalculator/Theme.dart';

class InputTextField extends StatelessWidget {
  String _inputText;

  String getInputText() {
    return _inputText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 99,
      style: TextStyle(color: getThemeData().accentColor),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: (String inserted) {
        _inputText = inserted;
      },
    );
  }
}
