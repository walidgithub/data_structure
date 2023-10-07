
// very flexible data structure

// every linked list has head node and tail node
// every node has a value and pointer to next node

// Constant time insertion.
// insertion
class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;

  // recursion function called toString()
  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }

}


// we use >> extends Iterable<E> to iterate
class LinkedList<E> extends Iterable<E> {

  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  // recursion function called toString()
  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  // Big O O(1)
  // insert new node at the start
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  // Big O O(1)
  // insert new node at the end
  void append(E value) {
    // 1
    if (isEmpty) {
      push(value);
      return;
    }

    // 2
    tail!.next = Node(value: value);

    // 3
    tail = tail!.next;
  }

  // Inserting in Middle of a List
  // 2 steps

  // Big O O(1)
  // 1- find particular node
  Node<E>? nodeAt(int index) {
    // 1
    var currentNode = head;
    var currentIndex = 0;

    // 2
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  // Big O O(1)
  // 2- insert new node after this index
  Node<E> insertAfter(Node<E> node, E value) {
    // 1
    if (tail == node) {
      append(value);
      return tail!;
    }

    // 2
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  // Removing ------------------------------------------------------------------

  // Big O O(1)
  // Popping From the Front of a List
  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  // Big O O(n)
  // Removing From the End of a List
  E? removeLast() {
    // 1
    if (head?.next == null) return pop();

    // 2
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    // 3
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  // Big O O(1)
  // Removing a Value From the Middle of a List
  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  // get iterator
  @override
  Iterator<E> get iterator => _LinkedListIterator(this);

}

// create iterator
// we added implements Iterable<E> to help us making iterator
class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  @override
  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;


  @override
  bool _firstPass = true;

  @override
  bool moveNext() {
    // 1
    if (_list.isEmpty) return false;

    // 2
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    // 3
    return _currentNode != null;
  }
}



