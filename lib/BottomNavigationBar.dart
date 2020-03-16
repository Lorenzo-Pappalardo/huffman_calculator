import 'package:flutter/material.dart';
import 'package:huffmancalculator/Theme.dart';

Widget getBottomNavigationBar() {
  return BottomNavigationBar(
    backgroundColor: getThemeData().primaryColor,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.translate,
          color: getThemeData().accentColor,
        ),
        title: Text(
          "Calculate",
          style: TextStyle(color: getThemeData().accentColor),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.restore,
          color: getThemeData().accentColor,
        ),
        title: Text(
          "Restore",
          style: TextStyle(color: getThemeData().accentColor),
        ),
      )
    ],
  );
}
