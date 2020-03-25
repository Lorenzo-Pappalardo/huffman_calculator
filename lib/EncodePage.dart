import 'package:flutter/material.dart';
import 'package:huffmancalculator/AppBar.dart';
import 'package:huffmancalculator/CalculateButton.dart';
import 'package:huffmancalculator/InputTextField.dart';
import 'package:huffmancalculator/Theme.dart';
import 'package:huffmancalculator/main.dart';

class EncodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getThemeData().backgroundColor,
      appBar: getAppBar(),
      floatingActionButton: CalculateButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Text(
              "Insert text to encode below",
              style: TextStyle(color: getThemeData().accentColor),
            ),
          ),
          InputTextField(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
