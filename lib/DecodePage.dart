import 'package:flutter/material.dart';
import 'package:huffmancalculator/AppBar.dart';
import 'package:huffmancalculator/Theme.dart';

class DecodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getThemeData().backgroundColor,
      appBar: getAppBar(),
      body: Text("TEST"),
    );
  }
}
