import 'package:dart_data_structure/II elementry%20data%20structure/04-%20queue/ring_buffer.dart';

import 'doubly_linked_list.dart';

abstract class Queue<E> {
  bool enqueue(E element);
  //enqueue: Insert an element at the back of the queue. Return true if the operation was successful.
  E? dequeue();
  // dequeue: Remove the element at the front of the queue and return it.
  bool get isEmpty;
  // isEmpty: Check if the queue is empty.
  E? get peek;
  // peek: Return the element at the front of the queue without removing it.
  // get the head element
}

// you’ll use a list to create a queue.
// this class inherit from prev abstract class
class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  // to add to list
  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  E? dequeue() => (isEmpty) ? null : _list.removeAt(0);

  @override
  bool get isEmpty => _list.isEmpty;

  // get the head
  @override
  E? get peek => (isEmpty) ? null : _list.first;

  @override
  String toString() => _list.toString();
}

// the most efficient way to implement queues is using linked lists
// queue linked list is a list of double linked list and using doubly linked_list
// *** because:
// Doubly linked list can be used in navigation systems where both forward and backward traversal is required.
// It can be used to implement different tree data structures.
// It can be used to implement undo/redo operations.
class QueueLinkedList<E> implements Queue<E> {
  final _list = DoublyLinkedList<E>();

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  E? dequeue() => _list.pop();

  @override
  bool get isEmpty => _list.isEmpty;

  // get the head
  @override
  E? get peek => _list.head?.value;

  @override
  String toString() => _list.toString();
}

// A ring-buffer-based implementation is good for queues with a fixed size.
class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  final RingBuffer<E> _ringBuffer;

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    }
    _ringBuffer.write(element);
    return true;
  }

  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}

