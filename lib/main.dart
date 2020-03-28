import 'package:flutter/material.dart';
import 'package:huffmancalculator/AppBar.dart';
import 'package:huffmancalculator/CalculateButton.dart';
import 'package:huffmancalculator/DecodePage.dart';
import 'package:huffmancalculator/DecodingResultPage.dart';
import 'package:huffmancalculator/EncodePage.dart';
import 'package:huffmancalculator/EncodingResultPage.dart';
import 'package:huffmancalculator/Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _pageIndex = 0;

  Widget _currentPage = EncodePage();

  void switchPage(int index) {
    if (index != _pageIndex) {
      setState(() {
        _pageIndex = index;
        if (_pageIndex == 0)
          _currentPage = EncodePage();
        else
          _currentPage = DecodePage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: getThemeData().backgroundColor,
        appBar: getAppBar(),
        floatingActionButton: CalculateButton(_pageIndex),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _currentPage,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: getThemeData().primaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.translate,
                color: getThemeData().accentColor,
              ),
              title: Text(
                "Encode",
                style: TextStyle(color: getThemeData().accentColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.restore,
                color: getThemeData().accentColor,
              ),
              title: Text(
                "Decode",
                style: TextStyle(color: getThemeData().accentColor),
              ),
            ),
          ],
          currentIndex: _pageIndex,
          onTap: (int i) => switchPage(i),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/encodingResultPage': (BuildContext context) =>
            EncodingResultPage(itf: EncodePage.itf),
        '/decodingResultPage': (BuildContext context) =>
            DecodingResultPage(
                ct: DecodePage.codedText, cc: DecodePage.charactersCodes),
      },
    );
  }
}