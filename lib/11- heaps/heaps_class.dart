// tree-based data structure with special properties to quickly fetch the largest or smallest element.

// A heap is a complete binary tree, also known as a binary heap, that can be constructed using a list.

/*
Heaps come in two flavors:

Max-heap, in which elements with a higher value have a higher priority.
Min-heap, in which elements with a lower value have a higher priority.
 */

// heap property:
/*
- In a max-heap, the value of every parent node is greater than or equal to that of its child.
- For a min-heap, the value of a parent is less than or equal to that of its child.
 */

// shape property:
/*
Another essential aspect of a heap is its shape property. A heap must be a complete binary tree.
 This means that every level must be filled except for the last level.
 Additionally, when adding elements to the last level, you must add them from left to right.
*/

// we can implement and treat with heap using list

/*
Use it whenever you need quick access to the largest (or smallest) item,
 because that item will always be the first element in the array or at the root of the tree.
 However, the remainder of the array is kept partially unsorted.
 Thus, instant access is only possible to the largest (smallest) item.
 */

enum Priority { max, min }

class Heap<E extends Comparable<dynamic>> {
  Heap({List<E>? elements, this.priority = Priority.max}) {
    this.elements = (elements == null) ? [] : elements;
    _buildHeap();
  }

  void _buildHeap() {
    if (isEmpty) return;
    final start = elements.length ~/ 2 - 1;
    for (var i = start; i >= 0; i--) {
      _siftDown(i);
    }
  }

  late final List<E> elements;
  final Priority priority;

  bool get isEmpty => elements.isEmpty;

  int get size => elements.length;

  E? get peek => (isEmpty) ? null : elements.first;

  void insert(E value) {
    elements.add(value);
    _siftUp(elements.length - 1);
  }

  void _siftUp(int index) {
    var child = index;
    var parent = _parentIndex(child);
    while (child > 0 && child == _higherPriority(child, parent)) {
      _swapValues(child, parent);
      child = parent;
      parent = _parentIndex(child);
    }
  }

  E? remove() {
    if (isEmpty) return null;
    _swapValues(0, elements.length - 1);
    final value = elements.removeLast();
    _siftDown(0);
    return value;
  }

  E? removeAt(int index) {
    final lastIndex = elements.length - 1;
    if (index < 0 || index > lastIndex) {
      return null;
    }
    if (index == lastIndex) {
      return elements.removeLast();
    }
    _swapValues(index, lastIndex);
    final value = elements.removeLast();
    _siftDown(index);
    _siftUp(index);
    return value;
  }

  void _siftDown(int index) {
    var parent = index;
    while (true) {
      final left = _leftChildIndex(parent);
      final right = _rightChildIndex(parent);
      var chosen = _higherPriority(left, parent);
      chosen = _higherPriority(right, chosen);
      if (chosen == parent) return;
      _swapValues(parent, chosen);
      parent = chosen;
    }
  }

  int indexOf(E value, {int index = 0}) {
    if (index >= elements.length) {
      return -1;
    }
    if (_firstHasHigherPriority(value, elements[index])) {
      return -1;
    }
    if (value == elements[index]) {
      return index;
    }
    final left = indexOf(value, index: _leftChildIndex(index));
    if (left != -1) return left;
    return indexOf(value, index: _rightChildIndex(index));
  }

  int _leftChildIndex(int parentIndex) {
    return 2 * parentIndex + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return 2 * parentIndex + 2;
  }

  int _parentIndex(int childIndex) {
    return (childIndex - 1) ~/ 2;
  }

  bool _firstHasHigherPriority(E valueA, E valueB) {
    if (priority == Priority.max) {
      return valueA.compareTo(valueB) > 0;
    }
    return valueA.compareTo(valueB) < 0;
  }

  int _higherPriority(int indexA, int indexB) {
    if (indexA >= elements.length) return indexB;
    final valueA = elements[indexA];
    final valueB = elements[indexB];
    final isFirst = _firstHasHigherPriority(valueA, valueB);
    return (isFirst) ? indexA : indexB;
  }

  void _swapValues(int indexA, int indexB) {
    final temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }

  @override
  String toString() => elements.toString();
}

/*
Time complexity:
from www.geeksforgeeks.org

* in min heap:
- insertion >> O(log n)
- Delete >> O(log n)
- Get value max or min >> O(1)
- Sorting >> O(n log n)
- Creating heap >> O(n log n)
- heapify >> O(n) (Heapify is the process of creating a heap data structure from a binary tree.
                   It is used to create a Min-Heap or a Max-Heap.)
 */

/*
1- The heap data structure is good for maintaining the highest- or lowest-priority element.
2- In a max-heap, the value of every parent node is greater than or equal to that of its child.
3- For a min-heap, the value of a parent is less than or equal to that of its child.
4- Every time you insert or remove items, you must take care to preserve the heap property, whether max or min.
5- There can’t be any holes in a heap. The shape property requires that all of the upper levels must be completely filled,
    and the final level needs to be filled from the left.
6- Elements in a heap are packed into contiguous memory using simple formulas for element lookup.
 */