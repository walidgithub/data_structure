import 'heaps_class.dart';

void testHeaps() {
  print('inserting');
  inserting();
  print('---------------------------');
  print('removing root');
  removingRoot();
  print('---------------------------');
  print('removing node by index 1');
  removingArbitraryNode();
  print('---------------------------');
  print('search for element 7 and get index');
  searchingForElement();
  print('---------------------------');
  print('sort by max');
  acceptingListInConstructorMax();
  print('---------------------------');
  print('sort by min');
  acceptingListInConstructorMin();
}

void inserting() {
  final heap = Heap<int>();
  heap.insert(8);
  heap.insert(6);
  heap.insert(5);
  heap.insert(4);
  heap.insert(3);
  heap.insert(2);
  heap.insert(1);
  print(heap);

  heap.insert(7);
  print(heap);
}

void removingRoot() {
  final heap = Heap<int>();
  heap.insert(10);
  heap.insert(8);
  heap.insert(5);
  heap.insert(4);
  heap.insert(6);
  heap.insert(2);
  heap.insert(1);
  heap.insert(3);

  final root = heap.remove();
  print(root);
  print(heap);
}

void removingArbitraryNode() {
  final heap = Heap<int>();
  heap.insert(10);
  heap.insert(7); // remove this
  heap.insert(2);
  heap.insert(5);
  heap.insert(1);
  print(heap);
  final index = 1;
  heap.removeAt(index);
  print(heap);
}

void searchingForElement() {
  final heap = Heap<int>();
  heap.insert(10);
  heap.insert(7);
  heap.insert(2);
  heap.insert(5);
  heap.insert(1);
  print(heap);

  final index = heap.indexOf(7);
  print(index);
}

void acceptingListInConstructorMax() {
  var heap = Heap(elements: [1, 12, 3, 4, 1, 6, 8, 7]);
  print(heap);

  while (!heap.isEmpty) {
    print(heap.remove());
  }
}

void acceptingListInConstructorMin() {
  var heap = Heap(
    elements: [1, 12, 3, 4, 1, 6, 8, 7],
    priority: Priority.min,
  );
  print(heap);

  while (!heap.isEmpty) {
    print(heap.remove());
  }
}
