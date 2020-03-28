import 'package:flutter/material.dart';
import 'package:huffmancalculator/Theme.dart';

class CalculateButton extends StatelessWidget {
  int _pageIndex;

  CalculateButton(this._pageIndex);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: getThemeData().accentColor,
      child: Icon(Icons.done),
      onPressed: () {
        if (_pageIndex == 0)
          Navigator.pushNamed(context, '/encodingResultPage');
        else
          Navigator.pushNamed(context, '/decodingResultPage');
      },
    );
  }
}
