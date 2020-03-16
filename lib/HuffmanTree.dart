class Node<T> {
  T key;
  Node<T> parent, left, right;

  Node(T key) {
    this.key = key;
    parent = left = right = null;
  }

  void setKey(T key) {
    this.key = key;
  }

  void setParent(Node<T> parent) {
    this.parent = parent;
  }

  void setLeft(Node<T> left) {
    this.left = left;
  }

  void setRight(Node<T> right) {
    this.right = right;
  }

  T getKey() {
    return key;
  }

  Node<T> getParent() {
    return parent;
  }

  Node<T> getLeft() {
    return left;
  }

  Node<T> getRight() {
    return right;
  }
}

class BST<T extends Comparable<T>> {
  Node<T> root;
  BST() {
    root = null;
  }

  void insert(T key) {
    Node<T> newNode = new Node<T>(key);
    Node<T> tmp = root;
    Node<T> parent = null;
    while (tmp != null) {
      parent = tmp;
      if (key.compareTo(tmp.getKey()) <= 0)
        tmp = tmp.getLeft();
      else
        tmp = tmp.getRight();
    }
    if (parent != null) {
      if (key.compareTo(parent.getKey()) <= 0)
        parent.setLeft(newNode);
      else
        parent.setRight(newNode);
    } else
      root = newNode;
    newNode.setParent(parent);
  }
}
