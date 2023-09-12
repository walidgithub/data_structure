
/*
add: adds an item to the queue
peek: returns the item in the queue with the highest priority without deleting the node
remove: removes and returns the item in the queue with the highest priority
 */
abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}
