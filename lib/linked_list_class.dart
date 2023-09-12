// Constant time insertion and removal from the front of the list.

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

// every linked list has head node and tail node
class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  // recursion function called toString()
  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }
}


