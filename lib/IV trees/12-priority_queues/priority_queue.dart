// A priority queue is another version of a queue in which elements are dequeued in priority order instead of FIFO order.

/*
Priority queues are very important to systems that juggle multiple programs and their execution (programs are chosen to run based on their priority).
 They are also very important to networking systems
*/

/*
A priority queue is a special type of queue. Each queue’s item has an additional piece of information, namely priority.
 Unlike a regular queue,
 the values in the priority queue are removed based on priority instead of the first-in-first-out (FIFO) rule.
*/

// A priority queue can be either of these two:
/*
Max-priority, in which the element at the front is always the largest.
Min-priority, where the element at the front is always the smallest.
*/

// we’ll implement a priority queue using a heap.

// Its only job is to enqueue and dequeue elements, nothing else.

/*
1- A priority queue is often used to retrieve elements in priority order.
2- A max-priority queue prioritizes the largest elements, while a min-priority queue, the smallest.
3- Wrapping a heap with a queue interface allows you to focus on the key operations of a queue while ignoring
   unneeded heap operations.
*/



import 'package:dart_data_structure/II elementry%20data%20structure/04-%20queue/queue_class.dart';

import '../11- heaps/heaps_class.dart';

class PriorityQueue<E extends Comparable<dynamic>> implements Queue<E> {
  PriorityQueue({
    List<E>? elements,
    Priority priority = Priority.max,
  }) {
    _heap = Heap<E>(elements: elements, priority: priority);
  }

  late Heap<E> _heap;

  @override
  bool get isEmpty => _heap.isEmpty;

  @override
  E? get peek => _heap.peek;

  @override
  bool enqueue(E element) {
    _heap.insert(element);
    return true;
  }

  @override
  E? dequeue() => _heap.remove();
}

/*
 --Time Complexity Analysis
 For insertion, we may have to heapify the entire heap data structure.
 So, while the insertion process only takes O(1) time, the heapify process will take O(log n).
 The same goes for deletion. We know where the max priority value is, but remaking the heap still takes O(log n) time.
 These are guaranteed worst-case efficiency since a binary heap always guarantees a complete tree.
 The time complexity to extract the value from a priority queue is O(1) since we only need to peek at the root node of the heap.
*/