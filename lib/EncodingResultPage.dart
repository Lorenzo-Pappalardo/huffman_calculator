import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huffmancalculator/HuffmanTree.dart';
import 'package:huffmancalculator/InputTextField.dart';
import 'package:huffmancalculator/Theme.dart';

HuffmanTree ht;
String _toEncode;

void calculateHuffmanCode(InputTextField itf) {
  ht = new HuffmanTree();
  _toEncode = itf.getInputText();
  if (_toEncode.length < 2)
    _toEncode =
        "Provide a text longer than 1 character, otherwise it's too easy ;)";
  for (int i = 0; i < _toEncode.length; i++) {
    ht.insertNode(_toEncode[i], 1);
  }
  ht.generateCodesAndText();
}

String getResultText() {
  return ht.getCodedText(_toEncode);
}

String getCharactersCodes() {
  return ht.getCodesForEachCharacter();
}

class EncodingResultPage extends StatelessWidget {
  final InputTextField itf;

  EncodingResultPage({@required this.itf});

  @override
  Widget build(BuildContext context) {
    calculateHuffmanCode(itf);
    return Scaffold(
      backgroundColor: getThemeData().backgroundColor,
      appBar: AppBar(
        backgroundColor: getThemeData().primaryColor,
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: getThemeData().accentColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Result",
          style: TextStyle(color: getThemeData().accentColor),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Text(
                      getResultText(),
                      style: TextStyle(
                        color: getThemeData().accentColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Copy to clipboard",
                    style: TextStyle(color: getThemeData().accentColor),
                  ),
                  onPressed: () => Clipboard.setData(
                    ClipboardData(text: getResultText()),
                  ),
                ),
                FlatButton(
                  child: Text(
                    "Show characters' codes",
                    style: TextStyle(color: getThemeData().accentColor),
                  ),
                  onPressed: () => Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(getCharactersCodes()),
                      action: SnackBarAction(
                        label: "Copy",
                        onPressed: () => Clipboard.setData(
                          ClipboardData(text: getCharactersCodes()),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
