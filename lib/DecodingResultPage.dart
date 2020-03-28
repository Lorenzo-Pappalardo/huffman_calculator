import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huffmancalculator/InputTextField.dart';
import 'package:huffmancalculator/Pair.dart';
import 'package:huffmancalculator/Theme.dart';

class DecodingResultPage extends StatelessWidget {
  final InputTextField ct;
  final InputTextField cc;
  String _decodedText;
  bool _invalid;

  DecodingResultPage({@required this.ct, @required this.cc}) {
    _decodedText = "";
    _invalid = false;
  }

  List buildCharactersList(String cc) {
    List charactersList = new List<Pair>();
    int length = cc.length;
    int i = 0;
    while (i < length) {
      String character = cc[i];
      i += 3;
      String code = "";
      while (cc[i] != '\n') {
        code += cc[i];
        i++;
        if (i == length) break;
      }
      i++;
      Pair tmp = new Pair();
      tmp.setCharacter(character);
      tmp.setCode(code);
      charactersList.add(tmp);
    }
    return charactersList;
  }

  void DecodeText(String codedText, String charactersCodes) {
    if (codedText.length == 0) {
      _decodedText =
          "Are you sure to have inserted inserted the text to decode? ;)";
      _invalid = true;
    } else if (charactersCodes.length == 0) {
      _decodedText =
          "Are you sure to have inserted the characters' codes for the text you provided? ;)";
      _invalid = true;
    } else {
      List charactersList = buildCharactersList(charactersCodes);
      String code = "";
      int i = 0;
      while (i < codedText.length) {
        code += codedText[i];
        for (Pair tmp in charactersList) {
          if (code == tmp.getCode()) {
            _decodedText += tmp.getCharacter();
            code = "";
          }
        }
        i++;
      }
      if (_decodedText == "") {
        _decodedText =
            "There's a problem! Be sure to match the text you want to decode with the right character codes! ;)";
        _invalid = true;
      }
    }
  }

  Color getTextColor() {
    if (_invalid == false) return getThemeData().accentColor;
    return getThemeData().errorColor;
  }

  @override
  Widget build(BuildContext context) {
    DecodeText(ct.getInputText(), cc.getInputText());
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
                      _decodedText,
                      style: TextStyle(
                        color: getTextColor(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              child: Text(
                "Copy to clipboard",
                style: TextStyle(color: getThemeData().accentColor),
              ),
              onPressed: () => Clipboard.setData(
                ClipboardData(text: _decodedText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
