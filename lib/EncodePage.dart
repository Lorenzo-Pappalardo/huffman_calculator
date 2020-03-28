import 'package:flutter/material.dart';
import 'package:huffmancalculator/InputTextField.dart';
import 'package:huffmancalculator/Theme.dart';

class EncodePage extends StatelessWidget {
  static InputTextField itf = new InputTextField();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Text(
              "Insert text to encode below",
              style: TextStyle(color: getThemeData().accentColor),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 8.0, right: 8.0, bottom: 35.0),
              child: itf,
            ),
          )
        ],
      ),
    );
  }
}
