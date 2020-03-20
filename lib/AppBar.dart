import 'package:flutter/material.dart';
import 'package:huffmancalculator/Theme.dart';

AppBar getAppBar() {
  return AppBar(
    backgroundColor: getThemeData().primaryColor,
    title: Text(
      "Huffman Calculator",
      style: TextStyle(color: getThemeData().accentColor),
    ),
    centerTitle: true,
  );
}
