class Node {
  String character;
  int frequency;
  Node left, right;

  Node(String character, int frequency) {
    this.character = character;
    this.frequency = frequency;
    left = right = null;
  }

  void setCharacter(String character) {
    this.character = character;
  }

  void setFrequency(int frequency) {
    this.frequency = frequency;
  }

  void setLeft(Node left) {
    this.left = left;
  }

  void setRight(Node right) {
    this.right = right;
  }

  String getCharacter() {
    return character;
  }

  int getFrequency() {
    return frequency;
  }

  Node getLeft() {
    return left;
  }

  Node getRight() {
    return right;
  }

  bool isLeaf() {
    return (left == null && right == null);
  }
}
