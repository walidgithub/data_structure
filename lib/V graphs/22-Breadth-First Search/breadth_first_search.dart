
/*
 Several algorithms exist to traverse or search through a graph’s vertices.
 One such algorithm is the breadth-first search (BFS) algorithm.
 The BFS algorithm visits the closest vertices from the starting vertex before moving on to further vertices.

 ** BFS can be used to solve a wide variety of problems:

 1- Finding potential paths between vertices.
 2- Finding the shortest path between two vertices.

 ** How Breadth-First Search Works
    A breadth-first search starts by selecting any vertex in a graph.
    The algorithm then explores all neighbors of this vertex before traversing the neighbors’ neighbors and so forth.

*/

/*
  A queue will help you keep track of which vertices to visit next.
  The first-in-first-out approach of the queue guarantees that all of a vertex’s neighbors are visited before you traverse one level deeper.
 */

/*
  // this video will explain search in graph with BFS https://www.youtube.com/watch?v=1ea6IypjgDI
  you will visit vertexes layer by layer on tree and add to queue then add another vertex depending on edge direction,
  and dequeue previous vertex and so on
 */

/*
  ** Key Points
     - Breadth-first search (BFS) is an algorithm for traversing or searching a graph.
     - BFS explores all the current vertex’s neighbors before traversing the next level of vertices.
     - It’s generally good to use this algorithm when your graph structure has many neighboring vertices or when you need to find out every possible outcome.
     - The queue data structure prioritises traversing a vertex’s edges before diving down to a level deeper.
 */



import '../../IV trees/05- trees/queue.dart';
import '../13-graphs/graphs.dart';

extension BreadthFirstSearch<E> on Graph<E> {
  List<Vertex<E>> breadthFirstSearch(Vertex<E> source) {
    final queue = QueueStack<Vertex<E>>();
    Set<Vertex<E>> enqueued = {};
    List<Vertex<E>> visited = [];

    queue.enqueue(source);
    enqueued.add(source);

    while (true) {
      final vertex = queue.dequeue();
      if (vertex == null) break;
      visited.add(vertex);
      final neighborEdges = edges(vertex);
      for (final edge in neighborEdges) {
        if (!enqueued.contains(edge.destination)) {
          queue.enqueue(edge.destination);
          enqueued.add(edge.destination);
        }
      }
    }

    return visited;
  }
}