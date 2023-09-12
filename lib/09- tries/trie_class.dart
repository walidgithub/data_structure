
// tree-based data structure
/*
- Tries provide great performance metrics for prefix matching.
- Tries are relatively memory efficient since individual nodes can be shared between many different values.
   For example, “car,” “carbs,” and “care” can share the first three letters of the word.
*/

class TrieNode<T> {
  TrieNode({this.key, this.parent});

  // 1
  T? key;

  // 2
  TrieNode<T>? parent;

  // 3
  Map<T, TrieNode<T>?> children = {};

  // 4
  bool isTerminating = false;
}
