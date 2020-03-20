import 'package:flutter/material.dart';
import 'package:huffmancalculator/HuffmanTree.dart';
import 'package:huffmancalculator/InputTextField.dart';
import 'package:huffmancalculator/Node.dart';
import 'package:huffmancalculator/Theme.dart';

String calculateHuffmanCode(String text) {
  HuffmanTree ht = new HuffmanTree();
  ht.insert("A", 5);
  ht.insert("B", 2);
  ht.insert("C", 3);
  List list = ht.getListOfNodes();
  String res = "";
  for (Node tmp in list) {
    res += tmp.character + "," + tmp.frequency.toString() + "\n";
  }
  res += "\n";
  Node tmp = ht.extractMin();
  res += tmp.character + "," + tmp.frequency.toString();
  res += "\n";
  tmp = ht.extractMin();
  res += tmp.character + "," + tmp.frequency.toString();
  res += "\n\n";
  for (Node tmp in list) {
    res += tmp.character + "," + tmp.frequency.toString() + "\n";
  }
  return res;
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
