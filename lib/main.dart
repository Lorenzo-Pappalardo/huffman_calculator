import 'package:flutter/material.dart';
import 'package:huffmancalculator/AppBar.dart';
import 'package:huffmancalculator/BottomNavigationBar.dart';
import 'package:huffmancalculator/CalculateButton.dart';
import 'package:huffmancalculator/InputTextField.dart';
import 'package:huffmancalculator/ResultPage.dart';
import 'package:huffmancalculator/Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      home: Scaffold(
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
        bottomNavigationBar: getBottomNavigationBar(),
      ),
      routes: <String, WidgetBuilder>{
        '/resultPage': (BuildContext context) => ResultPage(),
      },
    );
  }
}
