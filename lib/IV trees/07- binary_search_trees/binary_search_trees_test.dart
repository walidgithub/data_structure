import 'binary_search_trees_class.dart';

void testBinarySearchTrees() {
  // insertion ------------------
  // 1- Building an unbalanced Tree
  print('Building an unbalanced Tree');
  final treeUnB = BinarySearchTree<int>();
  for (var i = 0; i < 5; i++) {
    treeUnB.insert(i);
  }
  print(treeUnB);
  // ---------------------------------------------------

  // 2- Building a balanced Tree
  print('Building a balanced Tree');
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

  final treeB = buildExampleTree();
  print(treeB);

  // Finding element -----------------------------------------------------
  print('find element 5 in balanced tree');
  final tree = buildExampleTree();
  if (tree.contains(5)) {
    print("Found 5!");
  } else {
    print("Couldn’t find 5");
  }

  // Removing -----------------------------------------------------
  // final tree = buildExampleTree();
  // print('Tree before removal:');
  // print(tree);
  // tree.remove(3);
  // print('Tree after removing root:');
  // print(tree);


}
