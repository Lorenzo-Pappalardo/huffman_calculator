import 'package:flutter/material.dart';
import 'package:huffmancalculator/Theme.dart';

class InputTextField extends StatelessWidget {
  static String inputText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, left: 8.0, right: 8.0, bottom: 35.0),
        child: TextField(
          maxLines: 99,
          style: TextStyle(color: getThemeData().accentColor),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: (String inserted) {
            inputText = inserted;
          },
        ),
      ),
    );
  }
}
