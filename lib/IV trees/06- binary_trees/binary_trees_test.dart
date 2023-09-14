import 'binary_trees_class.dart';

void testBinaryTrees() {
  BinaryNode<int> createBinaryTree() {
    final zero = BinaryNode(0);
    final one = BinaryNode(1);
    final five = BinaryNode(5);
    final seven = BinaryNode(7);
    final eight = BinaryNode(8);
    final nine = BinaryNode(9);

    seven.leftChild = one;
    one.leftChild = zero;
    one.rightChild = five;
    seven.rightChild = nine;
    nine.leftChild = eight;

    return seven;
  }

  final tree = createBinaryTree();
  print(tree);

  // final tree2 = createBinaryTree();
  // tree2.traverseInOrder(print);

  // final tree2 = createBinaryTree();
  // tree2.traversePreOrder(print);

  final tree2 = createBinaryTree();
  tree2.traversePostOrder(print);
}