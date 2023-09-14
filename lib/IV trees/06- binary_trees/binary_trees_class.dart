// binary tree is a tree where each node has at most two children,
// often referred to as the left and right children

/*
the upper levels must be completely filled
 at least the final level needs to be filled from the left
*/


// it is not ordered

class BinaryNode<T> {
  BinaryNode(this.value);
  T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

  // traverse trees in order

  // In-order traversal recursively visits the left child first, then the current parent node,
  // and finally the right child.
  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  // get parent node then its first child then this child get its children then another child and its children

  // Pre-order traversal visits the parent node first, followed by the child nodes.
  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  // get from bottom to top (start from children and get their parent and go to another children to get
  // their parent and finally go to top parent)

  // Post-order traversal visits the child nodes before the parent nodes.
  void traversePostOrder(void Function(T value) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
      BinaryNode<T>? node, [
        String top = '',
        String root = '',
        String bottom = '',
      ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.value}\n';
    final c = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }

}
