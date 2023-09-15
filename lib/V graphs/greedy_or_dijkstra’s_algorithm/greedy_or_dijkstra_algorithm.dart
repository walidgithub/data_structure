/*
 Have you ever used a map app to find the shortest distance or fastest time from one place to another?
 Dijkstra’s algorithm is particularly useful in GPS networks to help find the shortest path between two locations.
 The algorithm works with weighted graphs, both directed and undirected,
 to calculate the optimal routes from one vertex to all others in the graph.

 Dijkstra’s algorithm is known as a greedy algorithm. That means it picks the most optimal path at every step along the way.
 It ignores solutions where some steps might have a higher intermediate cost but result in a lower overall cost for the entire path.
 Nevertheless, Dijkstra’s algorithm usually arrives at a pretty good solution very quickly.
 */


// this video will explain greedy https://www.youtube.com/watch?v=pMsld-iIAEE

import '../../IV trees/11- heaps/heaps_class.dart';
import '../../IV trees/12-priority_queues/priority_queue.dart';
import '../13-graphs/graphs.dart';

class Pair<T> extends Comparable<Pair<T>> {
  Pair(this.distance, [this.vertex]);

  double distance;
  Vertex<T>? vertex;

  @override
  int compareTo(Pair<T> other) {
    if (distance == other.distance) return 0;
    if (distance > other.distance) return 1;
    return -1;
  }

  @override
  String toString() => '($distance, $vertex)';
}

class Dijkstra<E> {
  Dijkstra(this.graph);

  final Graph<E> graph;

  Map<Vertex<E>, Pair<E>?> shortestPaths(Vertex<E> source) {
    final queue = PriorityQueue<Pair<E>>(priority: Priority.min);
    final visited = <Vertex<E>>{};
    final paths = <Vertex<E>, Pair<E>?>{};

    for (final vertex in graph.vertices) {
      paths[vertex] = null;
    }

    queue.enqueue(Pair(0, source));
    paths[source] = Pair(0);
    visited.add(source);

    while (!queue.isEmpty) {
      final current = queue.dequeue()!;
      final savedDistance = paths[current.vertex]!.distance;
      if (current.distance > savedDistance) continue;
      visited.add(current.vertex!);
      for (final edge in graph.edges(current.vertex!)) {
        final neighbor = edge.destination;
        if (visited.contains(neighbor)) continue;
        final weight = edge.weight ?? double.infinity;
        final totalDistance = current.distance + weight;
        final knownDistance = paths[neighbor]?.distance ?? double.infinity;
        if (totalDistance < knownDistance) {
          paths[neighbor] = Pair(totalDistance, current.vertex);
          queue.enqueue(Pair(totalDistance, neighbor));
        }
      }
    }
    return paths;
  }

  List<Vertex<E>> shortestPath(
      Vertex<E> source,
      Vertex<E> destination, {
        Map<Vertex<E>, Pair<E>?>? paths,
      }) {
    final allPaths = paths ?? shortestPaths(source);
    if (!allPaths.containsKey(destination)) return [];
    var current = destination;
    final path = <Vertex<E>>[current];
    while (current != source) {
      final previous = allPaths[current]?.vertex;
      if (previous == null) return [];
      path.add(previous);
      current = previous;
    }
    return path.reversed.toList();
  }
}