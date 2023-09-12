import 'linked_list_class.dart';

void testLinkedList(){
  // final node1 = Node(value: 1);
  // final node2 = Node(value: 2);
  // final node3 = Node(value: 3);
  //
  // node1.next = node2;
  // node2.next = node3;
  //
  // print(node1);
  // ----------------------------------------

  // Pushing to the Front of a List
  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);
  //
  // print(list);
  // ---------------------------------------

  // Appending to the End of a List
  // final list = LinkedList<int>();
  // list.append(1);
  // list.append(2);
  // list.append(3);
  //
  // print(list);
  // ---------------------------------------

  // Inserting in Middle of a List
  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);
  //
  // print('Before: $list');
  //
  // var middleNode = list.nodeAt(1)!;
  // list.insertAfter(middleNode, 42);
  //
  // print('After:  $list');

  // Removing

  // Popping From the Front of a List
  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);
  //
  // print('Before: $list');
  //
  // final poppedValue = list.pop();
  //
  // print('After:  $list');
  // print('Popped value: $poppedValue');

  // Removing From the End of a List
  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);
  //
  // print('Before: $list');
  //
  // final removedValue = list.removeLast();
  //
  // print('After:  $list');
  // print('Removed value: $removedValue');

  // Removing a Value From the Middle of a List
  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);
  //
  // print('Before: $list');
  //
  // final firstNode = list.nodeAt(0);
  // final removedValue = list.removeAfter(firstNode!);
  //
  // print('After:  $list');
  // print('Removed value: $removedValue');

  // Making a List Iterable
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  for (final element in list) {
    print(element);
  }

}