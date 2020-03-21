import 'package:huffmancalculator/Node.dart';
import 'package:huffmancalculator/Pair.dart';

class HuffmanTree {
  List _pairs;
  List _nodes;
  Node root;
  String res;

  Node _extractMin() {
    return _nodes.removeAt(0);
  }

  void _buildTree() {
    for (int i = 0; i < _nodes.length; i++) {
      Node left = _extractMin();
      Node right = _extractMin();
      Node sum = new Node('\0', left.getFrequency() + right.getFrequency());
      sum.setLeft(left);
      sum.setRight(right);
      insertNode(sum);
    }
    root = _extractMin();
  }

  void _buildCodesRecursively(Node tmpNode, String code) {
    if (tmpNode != null) {
      if (tmpNode.isLeaf() == true) {
        for (Pair tmpPair in _pairs) {
          if (tmpNode.getCharacter() == tmpPair.getCharacter()) {
            tmpPair.setCode(code);
          }
        }
      }
      _buildCodesRecursively(tmpNode.getLeft(), code + '0');
      _buildCodesRecursively(tmpNode.getRight(), code + '1');
    }
  }

  HuffmanTree() {
    _pairs = new List<Pair>();
    _nodes = new List<Node>();
    root = null;
    res = '';
  }

  void insertPair(Node newNode) {
    Pair tmp = new Pair();
    tmp.setCharacter(newNode.getCharacter());
    _pairs.add(tmp);
  }

  void insertNode(Node newNode) {
    _nodes.add(newNode);
    insertPair(newNode);
    _nodes.sort((a, b) => a.getFrequency().compareTo(b.getFrequency()));
  }

  String _printTree(Node tmp) {
    if (tmp != null) {
      _printTree(tmp.getLeft());
      res += tmp.getCharacter() + ',' + tmp.getFrequency().toString() + ' ';
      _printTree(tmp.getRight());
    }
    return res;
  }

  String printTree() {
    _buildTree();
    return _printTree(root);
  }

  String printCodes() {
    res = '\n';
    _buildCodesRecursively(root, '');
    for (Pair tmp in _pairs) {
      if (tmp.getCharacter() != '\0') {
        res += tmp.getCharacter() + ',' + tmp.getCode() + ' ';
      }
    }
    return res;
  }
}
