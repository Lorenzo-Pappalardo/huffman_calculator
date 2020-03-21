import 'package:flutter/material.dart';
import 'package:huffmancalculator/HuffmanTree.dart';
import 'package:huffmancalculator/InputTextField.dart';
import 'package:huffmancalculator/Theme.dart';

String calculateHuffmanCode(String text) {
  HuffmanTree ht = new HuffmanTree();
  if (text != null && text.length > 1) {
    for (int i = 0; i < text.length; i++) {
      ht.insertNode(text[i], 1);
    }
    String res = ht.printTree();
    res += ht.printCodes();
    return res;
  }
  return "There's nothing to calculate, move along!";
}

class CalculateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: getThemeData().accentColor,
      child: Icon(Icons.done),
      onPressed: () => Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(calculateHuffmanCode(InputTextField.inputText)),
        ),
      ),
      heroTag: true,
    );
  }
}
