import 'package:flutter/material.dart';
import 'package:huffmancalculator/InputTextField.dart';
import 'package:huffmancalculator/Theme.dart';

class CalculateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: getThemeData().accentColor,
      child: Icon(Icons.done),
      onPressed: () => Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(InputTextField.inputText),
        ),
      ),
      heroTag: true,
    );
  }
}
