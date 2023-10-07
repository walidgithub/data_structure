
import 'package:dart_data_structure/II elemntry%20data%20structure/04-%20queue/queue_class.dart';

// Queues use FIFO(first-in-first-out)
// Notice that the queue only cares about removal from the front and insertion at the back.
// it guarantees a fair order.

/*
  Example for queue is putting the requests to a server

So to fix this, we actually implemented a queue on the client.
 Anytime a client would make an action to make a request to the server we queued the request,
 as opposed to making the request instantly.

By putting the requests into a queue, we could cap the maximum number of concurrent requests
 a user could make capped at 10. This kept any user from making thousands of requests instantly
 to our server. This fixed big users bringing down our server and this made Larry much happier.
 This also kept our requests in order and allowed us to hold the requests for processing.
 A queue was a perfect structure for this system!
  */

void testQueueList(){
  final queue = QueueList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);

  // Big o of queue is O(1) >> insertion and removal and get an element
}

// test queueLinkedList
void testQueueLinkedList() {
  final queue = QueueLinkedList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue); // [Ray, Brian, Eric]

  queue.dequeue();
  print(queue); // [Brian, Eric]

  queue.peek;
  print(queue); // [Brian, Eric]
}

void testQueueRingBuffer() {
  final queue = QueueRingBuffer<String>(10);
  queue.enqueue("Ray");
  queue.enqueue("Brian");
  queue.enqueue("Eric");
  print(queue); // [Ray, Brian, Eric]

  queue.dequeue();
  print(queue); // [Brian, Eric]

  queue.peek;
  print(queue); // [Brian, Eric]
}