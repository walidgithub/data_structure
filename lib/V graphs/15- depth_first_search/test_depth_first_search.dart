
import 'package:dart_data_structure/V%20graphs/15-%20depth_first_search/depth_first_search.dart';

import '../13-graphs/graphs.dart';

void testDepthFirstSearchAndCycles() {
  depthFirstSearch();
  cycles();
}

void depthFirstSearch() {
  final graph = AdjacencyList<String>();

  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');
  final f = graph.createVertex('F');
  final g = graph.createVertex('G');
  final h = graph.createVertex('H');

  graph.addEdge(a, b, weight: 1);
  graph.addEdge(a, c, weight: 1);
  graph.addEdge(a, d, weight: 1);
  graph.addEdge(b, e, weight: 1);
  graph.addEdge(c, g, weight: 1);
  graph.addEdge(e, f, weight: 1);
  graph.addEdge(e, h, weight: 1);
  graph.addEdge(f, g, weight: 1);
  graph.addEdge(f, c, weight: 1);

  final vertices = graph.depthFirstSearch(a);
  vertices.forEach(print);
}

void cycles() {
  final graph = AdjacencyList<String>();

  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');

  graph.addEdge(a, b, edgeType: EdgeType.directed);
  graph.addEdge(a, c, edgeType: EdgeType.directed);
  graph.addEdge(c, a, edgeType: EdgeType.directed);
  graph.addEdge(b, c, edgeType: EdgeType.directed);
  graph.addEdge(c, d, edgeType: EdgeType.directed);

  print(graph);
  print(graph.hasCycle(a));
}