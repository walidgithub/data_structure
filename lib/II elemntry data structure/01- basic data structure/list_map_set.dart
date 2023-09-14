import 'dart:collection';

void testList(){
  final people = ['Pablo', 'Manda', 'Megan'];
  print(people);
  print('get index 0 >> ${people[0]}');
  people.add('walid');
  print('after adding walid >> $people');
  people.insert(0, 'Ray');
  print('insert Ray at the first >> $people');

// Dart lists can also be growable or fixed-length
// in fixed list you won’t be able to add or remove elements anymore as you could in a growable list.
// in insert (best case to insert at the end - bad case to insert at the any place in tne middle - worst case to
// add at the first)

// Big o O(n) in insertion and removal and to get data
// from first Big o is O(1)

// you can make it O(log n) if it was sorted list using divide and conquer strategy
}

void testMap(){
  // key and value
  final scores = {'Eric': 9, 'Mark': 12, 'Wayne': 1};
  print('map >> $scores');
  // to add
  scores['Andrew'] = 0;
  print('add new value "andrew = 0" >> $scores');

  // Big O for map
  // Inserting into a map always takes a constant amount of time. faster than list

  // hashMap
  final hashMap = HashMap.of(scores);
  print('after convert to hashMap (makes no guarantees about order.)>> $hashMap');
}

void testSet(){
  // A set is a container that holds unique values
  var bag = {'Candy', 'Juice', 'Gummy'};
  print(bag);
  bag.add('Candy');
  print('add Candy again');

  print('no item added >> $bag');
 // Big o is like list
}
