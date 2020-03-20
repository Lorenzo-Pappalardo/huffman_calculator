import 'package:huffmancalculator/Node.dart';

class HuffmanTree {
  Map<String, String> map;
  List nodes;
  String res;

  Node _extractMin() {
    return nodes.removeAt(0);
  }

  Node _buildTree() {
    for (int i = 0; i < nodes.length; i++) {
      Node left = _extractMin();
      Node right = _extractMin();
      Node sum = new Node('\0', left.getFrequency() + right.getFrequency());
      sum.setLeft(left);
      sum.setRight(right);
      insertNode(sum);
    }
    return _extractMin();
  }

  HuffmanTree() {
    map = new Map<String, String>();
    nodes = new List<Node>();
    res = "";
  }

  void insertNode(Node newNode) {
    nodes.add(newNode);
    nodes.sort((a, b) => a.getFrequency().compareTo(b.getFrequency()));
  }

  void _printTree(Node tmp) {
    if (tmp != null) {
      _printTree(tmp.getLeft());
      res += tmp.getCharacter() + "," + tmp.getFrequency().toString() + " ";
      _printTree(tmp.getRight());
    }
  }

  String printTree() {
    Node root = _buildTree();
    _printTree(root);
    if (res == "") res = "No input provided!";
    return res;
  }
}
