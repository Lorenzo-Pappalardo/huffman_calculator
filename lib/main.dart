import 'package:flutter/material.dart';
import 'package:huffmancalculator/DecodePage.dart';
import 'package:huffmancalculator/EncodePage.dart';
import 'package:huffmancalculator/ResultPage.dart';
import 'package:huffmancalculator/Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static int _pageIndex = 0;

  static Widget _currentPage = EncodePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      home: _currentPage,
      routes: <String, WidgetBuilder>{
        '/decodepage': (BuildContext context) => DecodePage(),
        '/resultPage': (BuildContext context) => ResultPage(),
      },
    );
  }
}

Widget bottomNavigationBar() {
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
    currentIndex: 0,
    onTap: (int i) => null,
  );
}
