import 'package:flutter/material.dart';
import 'package:huffmancalculator/InputTextField.dart';
import 'package:huffmancalculator/Theme.dart';

class DecodePage extends StatelessWidget {
  static final InputTextField codedText = new InputTextField();
  static final InputTextField charactersCodes = new InputTextField();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Text(
              "Insert text to decode below",
              style: TextStyle(color: getThemeData().accentColor),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: codedText,
            ),
          ),
          Text(
            "Insert characters' codes below",
            style: TextStyle(color: getThemeData().accentColor),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 8.0, right: 8.0, bottom: 35.0),
              child: charactersCodes,
            ),
          ),
        ],
      ),
    );
  }
}
