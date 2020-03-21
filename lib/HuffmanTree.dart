import 'package:huffmancalculator/Node.dart';
import 'package:huffmancalculator/Pair.dart';

class HuffmanTree {
  List _pairs;
  List _nodes;
  int _nodesNum;
  Node _root;
  String _res;

  Node _isPresent(String character) {
    for (Node tmp in _nodes) {
      if (tmp.getCharacter() == character) {
        return tmp;
      }
    }
    return null;
  }

  void _sortNodes() {
    _nodes.sort((a, b) => a.getFrequency().compareTo(b.getFrequency()));
  }

  Node _makeNode(String character, int frequency) {
    return new Node(character, frequency);
  }

  void _insertPair(Node newNode) {
    Pair tmp = new Pair();
    tmp.setCharacter(newNode.getCharacter());
    _pairs.add(tmp);
  }

  Node _extractMin() {
    _sortNodes();
    return _nodes.removeAt(0);
  }

  void _buildTree() {
    for (int i = 0; i < _nodesNum - 1; i++) {
      Node left = _extractMin();
      Node right = _extractMin();
      Node sum = _makeNode('\0', left.getFrequency() + right.getFrequency());
      sum.setLeft(left);
      sum.setRight(right);
      _nodes.add(sum);
    }
    _root = _extractMin();
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
    _nodesNum = 0;
    _root = null;
    _res = '';
  }

  void insertNode(String character, int frequency) {
    Node tmp = _isPresent(character);
    if (tmp != null) {
      tmp.updateFrequency();
      _sortNodes();
    }
    else {
      Node newNode = _makeNode(character, frequency);
      _nodes.add(newNode);
      _insertPair(newNode);
      _sortNodes();
      _nodesNum++;
    }
  }

  String _printTree(Node tmp) {
    if (tmp != null) {
      _printTree(tmp.getLeft());
      _res += tmp.getCharacter() + ',' + tmp.getFrequency().toString() + ' ';
      _printTree(tmp.getRight());
    }
    return _res;
  }

  String printTree() {
    _buildTree();
    return _printTree(_root);
  }

  String printCodes() {
    _res = '\n';
    _buildCodesRecursively(_root, '');
    for (Pair tmp in _pairs) {
      if (tmp.getCharacter() != '\0') {
        _res += tmp.getCharacter() + ',' + tmp.getCode() + ' ';
      }
    }
    return _res;
  }
}
