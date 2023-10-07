
// Representing hierarchical relationships.
// Managing sorted data.
// Facilitating fast lookup operations.
// Like the linked list, trees are made up of nodes.
// Trees are viewed starting from the top and branching towards the bottom, just like a real tree.
// The topmost node in the tree is called the root of the tree. It is the only node that has no parent
// A node is a leaf if it has no children

/*
- Trees share some similarities to linked lists, but,
  whereas linked-list nodes may only link to one successor node,
  a tree node can link to many child nodes.
- Every tree node, except for the root node, has exactly one parent node.
- A root node has no parent nodes.
- Leaf nodes have no child nodes.
- Traversals, such as depth-first and level-order traversals, work on multiple types of trees. However,
  the implementation will be slightly different based on how the tree is structured.
 */

import 'package:dart_data_structure/IV trees/05-%20trees/queue.dart';

class TreeNode<T> {
  TreeNode(this.value);
  T value;
  List<TreeNode<T>> children = [];

  void add(TreeNode<T> child) {
    children.add(child);
  }

  // search from top to bottom
  // first for every parent and search in it for its children (parents or leaves) and again if parent it'll get its children (parents or leaves)
  // then move to next parent
  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    performAction(this);
    for (final child in children) {
      child.forEachDepthFirst(performAction);
    }
  }

  // if you want to return parents first then get the children we will use queueStack
  void forEachLevelOrder(void Function(TreeNode<T> node) performAction) {
    final queue = QueueStack<TreeNode<T>>();
    performAction(this);
    children.forEach(queue.enqueue);
    var node = queue.dequeue();
    while (node != null) {
      performAction(node);
      node.children.forEach(queue.enqueue);
      node = queue.dequeue();
    }
  }

  // Search in tree
  TreeNode? search(T value) {
    TreeNode? result;
    forEachLevelOrder((node) {
      if (node.value == value) {
        result = node;
      }
    });
    return result;
  }
}
