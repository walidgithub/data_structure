
import 'package:dart_data_structure/II%20elementry%20data%20structure/01-%20basic%20data%20structure/list_map_set.dart';
import 'package:dart_data_structure/II%20elementry%20data%20structure/02-%20linked_list/test_linked_list.dart';
import 'package:dart_data_structure/II%20elementry%20data%20structure/03-%20stack/stack_implementation.dart';
import 'package:dart_data_structure/II%20elementry%20data%20structure/04-%20queue/test_queues.dart';
import 'package:dart_data_structure/IV%20trees/05-%20trees/trees_test.dart';
import 'package:dart_data_structure/IV%20trees/06-%20binary_trees/binary_trees_test.dart';
import 'package:dart_data_structure/IV%20trees/07-%20binary_search_trees/binary_search_trees_test.dart';
import 'package:dart_data_structure/IV%20trees/08-%20avl_trees/avl_trees_test.dart';
import 'package:dart_data_structure/IV%20trees/09-%20tries/test_tries.dart';
import 'package:dart_data_structure/IV%20trees/10-%20binary_search/test_binary_search.dart';
import 'package:dart_data_structure/IV%20trees/11-%20heaps/heaps_test.dart';
import 'package:dart_data_structure/IV%20trees/12-priority_queues/test_priority_queue.dart';
import 'package:dart_data_structure/V%20graphs/13-graphs/test_graphs.dart';
import 'package:dart_data_structure/V%20graphs/14-breadth-first-search/test_breadth_first_search.dart';
import 'package:dart_data_structure/V%20graphs/greedy_or_dijkstra%E2%80%99s_algorithm/test_greedy_or_dijkstra_algorithm.dart';

void main(List<String> arguments) {
  // print(big_O
  //     .betterNaiveContains(10, [1, 2, 5, 4, 8, 9, 10, 12, 15, 14, 17, 18, 22]));
  //
  // testList();

  // testMap(); // key and value

  // testSet(); // unique values

  // testLinkedList(); // head and tail nodes with value and next fields

  // testStack(); // FILO // to limit access and for maze goals and undo example

  // testQueueList(); // FIFO // we use queue in general to limit access (here we used normal list)
  // testQueueLinkedList(); // navigation system back and forward examples (most efficient way is using doubly linked list)
  // testQueueRingBuffer(); // queues with a fixed size


  /*
  An example of where tree structure is used in real life is a company’s hierarchy.
  each person (employee) has a boss all the way up to the CEO of a company.

  Each person represents a node. A node at the bottom is called a leaf. The node at the top is called the root.
  The root node doesn't have a parent, but it has two children.
  Each of these children has two children of their own- leaves.
  however, each node- including the root- could have as many children.
  The leaf node, however, doesn't have any children as it is the lowest in the hierarchy.
  */

  // testTrees(); // root node and parents and their children (node can has one or more child)
  // testBinaryTrees(); // unsorted binary tree (every node has two children) (perfect balanced, good enough balanced and unbalanced)
  // testBinarySearchTrees(); // sorted binary tree
  // testAVLTrees(); // balance unbalanced tree when remove or insert

  // testTries(); // check if word contains some letters and prefix matching examples and based on Tree data structure

  // testBinarySearch(); // search using binary search

  // testHeaps();
  // based on Tree data structure to quickly fetch the largest or smallest element
  // it is a complete binary tree and it can be constructed using a list
  // (two flavors Max-heap {a higher value have a higher priority} and Min-heap {a lower value have a higher priority})

  // testPriorityQueue();
  // is often used to retrieve elements in priority order
  // is another version of a queue in which elements are dequeued in priority order instead of FIFO order
  // we’ll implement a priority queue using a heap
  // Its only job is to enqueue and dequeue elements, nothing else
  // (two flavors Max-priority {element at the front is always the largest} and Min-priority {element at the front is always the smallest})


  // Graph >> captures relationships between objects,
  //       >> It’s made up of vertices connected by edges.

  // Types >>
  // Weighted Graphs: Let you choose the cheapest or shortest path between two vertices by calc the cost of distance between them(edge).
  // Directed Graphs: Directed graphs are more restrictive to traverse because an edge may only permit traversal in one direction.
  // Undirected Graphs: You can think of an undirected graph as a directed graph where all edges are bi-directional (dual directions).

  // print('---------------------- AdjacencyList ----------------------');
  // testGraphsWithAdjacencyList();
  // print('------------------------------------------------------------');
  // print('---------------------- AdjacencyMatrix ----------------------');
  // print('------------------------------------------------------------');
  // testGraphsWithAdjacencyMatrix();

  testBreadthFirstSearch();

  // testDepthFirstSearchAndCycles();

  // testGreedyOrDijkstraAlgorithm();
}
