

import 'package:dart_data_structure/IV trees/09-%20tries/string_trie.dart';

void testTries() {

  // insert and remove

  // final trie = StringTrie();
  // trie.insert('cut');
  // trie.insert('cute');
  //
  // assert(trie.contains('cut'));
  // print('"cut" is in the trie');
  // assert(trie.contains('cute'));
  // print('"cute" is in the trie');
  //
  // print('\n--- Removing "cut" ---');
  // trie.remove('cut');
  // assert(!trie.contains('cut'));
  // assert(trie.contains('cute'));
  // print('"cute" is still in the trie');
  // ------------------------------------------

  // match prefix

  final trie = StringTrie();
  trie.insert('car');
  trie.insert('card');
  trie.insert('care');
  trie.insert('cared');
  trie.insert('cars');
  trie.insert('carbs');
  trie.insert('carapace');
  trie.insert('cargo');

  print('Collections starting with "car"');
  final prefixedWithCar = trie.matchPrefix('car');
  print(prefixedWithCar);

  print('\nCollections starting with "care"');
  final prefixedWithCare = trie.matchPrefix('care');
  print(prefixedWithCare);

}
