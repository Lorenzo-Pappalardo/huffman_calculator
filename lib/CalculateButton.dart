import 'package:flutter/material.dart';
import 'package:huffmancalculator/HuffmanTree.dart';
import 'package:huffmancalculator/InputTextField.dart';
import 'package:huffmancalculator/Node.dart';
import 'package:huffmancalculator/Theme.dart';

Node makeNode(String character, int frequency) {
  return new Node(character, frequency);
}

String calculateHuffmanCode(String text) {
  HuffmanTree ht = new HuffmanTree();
  ht.insertNode(makeNode("A", 5));
  ht.insertNode(makeNode("B", 2));
  ht.insertNode(makeNode("C", 3));
  return ht.printTree();
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
