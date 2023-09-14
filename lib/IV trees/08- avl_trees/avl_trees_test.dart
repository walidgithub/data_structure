import 'avl_trees_class.dart';

void testAVLTrees() {
  inserting();
  removing();
}

void inserting() {
  final tree = AvlTree<int>();
  for (var i = 0; i < 15; i++) {
    tree.insert(i);
  }
  print(tree);
}

void removing() {
  final tree = AvlTree<int>();
  tree.insert(15);
  tree.insert(10);
  tree.insert(16);
  tree.insert(18);
  print(tree);
  tree.remove(10);
  print(tree);
}
