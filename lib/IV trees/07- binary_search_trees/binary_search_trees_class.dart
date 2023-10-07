// big o for binary search trees in O(log n) for insert or remove or contains in balanced tree
// big o for binary search trees in O(n) for insert or remove or contains in unbalanced tree

/*
A binary search tree, or BST, is a data structure that facilitates fast lookup, insert and removal operations.
 Consider the following decision tree where picking a side forfeits all the possibilities of the other side,
 cutting the problem in half.
*/

// Rules:
// 1- The value of a left child must be less than the value of its parent.
// 2- Consequently, the value of a right child must be greater than or equal to the value of its parent.
// like: 9 is the parent node so left child can be 8 and right child can be 10 or 9
// [parent is 9 >>> L child -> 8 , R child -> 9 or 10 for example]
// so it is ordered


// The binary search tree (BST) is a powerful data structure for holding sorted data.

import '../06- binary_trees/binary_trees_class.dart';

class BinarySearchTree<E extends Comparable<dynamic>> {
  BinaryNode<E>? root;

  // insertion (with respecting previous rules)
  void insert(E value) {
    root = _insertAt(root, value);
  }

  BinaryNode<E> _insertAt(BinaryNode<E>? node, E value) {
    // 1
    if (node == null) {
      return BinaryNode(value);
    }
    // 2
    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }
    // 3
    return node;
  }
  // ------------------------------------------------------------------

  // Finding element -----------------------------------------------------
  bool contains(E value) {
    // 1
    var current = root;
    // 2
    while (current != null) {
      // 3
      if (current.value == value) {
        return true;
      }
      // 4
      if (value.compareTo(current.value) < 0) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
    }
    return false;
  }

  // Removing element -----------------------------------------------------
  // Cases:
  // 1- Removing a leaf node is straightforward. Simply detach the leaf node
  // 2- Removing nodes with one child, you’ll need to reconnect that child with the rest of the tree
  // 3- Removing nodes with two children, you need to decide if * this node is the root then
  // you'll choose another node to be the root.
  // Else if * this node is under the root node then if it has children then you can make them parent nodes
  // Or * choose specific leaf to be the parent for these parent nodes with previous rules


  void remove(E value) {
    root = _remove(root, value);
  }

  BinaryNode<E>? _remove(BinaryNode<E>? node, E value) {
    if (node == null) return null;
    if (value == node.value) {
      // 1
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }
      // 2
      if (node.leftChild == null) {
        return node.rightChild;
      }
      if (node.rightChild == null) {
        return node.leftChild;
      }
      // 3
      node.value = node.rightChild!.min.value;
      node.rightChild = _remove(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _remove(node.leftChild, value);
    } else {
      node.rightChild = _remove(node.rightChild, value);
    }
    return node;
  }
  // ----------------------------------------------------------------------

  @override
  String toString() => root.toString();
}

extension _MinFinder<E> on BinaryNode<E> {
  BinaryNode<E> get min => leftChild?.min ?? this;
}
