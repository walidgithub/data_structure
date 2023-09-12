import 'package:dart_data_structure/12-priority_queues/priority_queue.dart';

void testPriorityQueue() {
  var priorityQueue = PriorityQueue<num>(
    elements: [1, 12, 3, 4, 1, 6, 8, 7],
  );
  while (!priorityQueue.isEmpty) {
    print(priorityQueue.dequeue()!);
  }
}