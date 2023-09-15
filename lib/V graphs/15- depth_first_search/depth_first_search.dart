/*
** How Depth-First Search Works:
    DFS will use a stack to keep track of the levels you move through.
    The stack’s last-in-first-out approach helps with backtracking.
    Every push on the stack means that you move one level deeper.
    You can pop to return to a previous level if you reach a dead end.
*/

import '../../II elemntry data structure/03- stack/stack_class.dart';
import '../13-graphs/graphs.dart';

extension DepthFirstSearch<E> on Graph<E> {
  List<Vertex<E>> depthFirstSearch(Vertex<E> source) {
    final stack = Stack<Vertex<E>>();
    final pushed = <Vertex<E>>{};
    final visited = <Vertex<E>>[];

    stack.push(source);
    pushed.add(source);
    visited.add(source);

    outerLoop:
    while (stack.isNotEmpty) {
      final vertex = stack.peek;
      final neighbors = edges(vertex);
      for (final edge in neighbors) {
        if (!pushed.contains(edge.destination)) {
          stack.push(edge.destination);
          pushed.add(edge.destination);
          visited.add(edge.destination);
          continue outerLoop;
        }
      }
      stack.pop();
    }

    return visited;
  }
}


/*
 ** Cycles
    A depth-first search is also useful for finding whether a graph contains cycles.
    A graph is said to have a cycle when a path of edges and vertices leads back to the same source.
 */

// Next, you’ll write an algorithm to check whether a directed graph contains a cycle.
extension CyclicGraph<E> on Graph<E> {
  bool hasCycle(Vertex<E> source) {
    Set<Vertex<E>> pushed = {};
    return _hasCycle(source, pushed);
  }

  bool _hasCycle(Vertex<E> source, Set<Vertex<E>> pushed) {
    pushed.add(source);
    final neighbors = edges(source);
    for (final edge in neighbors) {
      if (!pushed.contains(edge.destination)) {
        if (_hasCycle(edge.destination, pushed)) {
          return true;
        }
      } else {
        return true;
      }
    }
    pushed.remove(source);
    return false;
  }
}


/*
  ** Key Points
     - Depth-first search (DFS) is another algorithm to traverse or search a graph.
     - DFS explores a branch as far as possible before backtracking to the next branch. branch by branch
     - The stack data structure allows you to backtrack.
     - you backtrack to complete the branch before you start on another branch
     - A graph is said to have a cycle when a path of edges and vertices leads back to the source vertex.
*/

// here video to show difference between BFS and DFS https://www.youtube.com/watch?v=QH1WvzW6ErU