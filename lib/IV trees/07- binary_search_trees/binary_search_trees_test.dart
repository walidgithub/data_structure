import 'binary_search_trees_class.dart';

void testBinarySearchTrees() {
  // insertion ------------------
  // 1- Building an Unbalanced Tree
  // final tree2 = BinarySearchTree<int>();
  // for (var i = 0; i < 5; i++) {
  //   tree2.insert(i);
  // }
  // print(tree2);
  // ---------------------------------------------------

  // 2-
  // Building a Balanced Tree -----------------------------------------------------------
  BinarySearchTree<int> buildExampleTree() {
    var tree = BinarySearchTree<int>();
    tree.insert(3);
    tree.insert(1);
    tree.insert(4);
    tree.insert(0);
    tree.insert(2);
    tree.insert(5);
    return tree;
  }

  final tree = buildExampleTree();
  print(tree);

  // Finding element -----------------------------------------------------
  // final tree = buildExampleTree();
  // if (tree.contains(5)) {
  //   print("Found 5!");
  // } else {
  //   print("Couldn’t find 5");
  // }

  // Removing -----------------------------------------------------
  // final tree = buildExampleTree();
  print('Tree before removal:');
  // print(tree);
  tree.remove(3);
  print('Tree after removing root:');
  print(tree);


}
