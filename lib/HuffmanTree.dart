import 'package:huffmancalculator/Node.dart';

class HuffmanTree {
  List nodes;
  Node root;

  HuffmanTree() {
    nodes = new List<Node>();
    root = null;
  }

  void insert(String character, int frequency) {
    nodes.add(new Node(character, frequency));
    nodes.sort((a, b) => a.frequency.compareTo(b.frequency));
  }

  Node extractMin() {
    return nodes.removeAt(0);
  }

  List getListOfNodes() {
    return nodes;
  }
}
