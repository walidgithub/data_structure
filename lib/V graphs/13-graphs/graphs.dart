// A graph is a data structure that captures relationships between objects. It’s made up of vertices connected by edges.

/*
Types of Graphs:

1- Weighted Graphs:
    In a weighted graph, every edge has a weight associated with it that represents the cost of using this edge.
    These weights let you choose the cheapest or shortest path between two vertices.

2- Directed Graphs:
    As well as assigning a weight to an edge, your graphs can also have direction.
    Directed graphs are more restrictive to traverse because an edge may only permit traversal in one direction.

3- Undirected Graphs:
    You can think of an undirected graph as a directed graph where all edges are bi-directional.
*/

/*
  There are a number of common operations that any graph needs to implement.
  Before you get to those, though, you need the basic building blocks, that is, the vertices and edges.
*/
// Defining a Vertex
class Vertex<T> {
  const Vertex({
    required this.index,
    required this.data,
  });

  final int index;
  final T data;

  @override
  String toString() => data.toString();
}

// Defining an Edge
class Edge<T> {
  const Edge(
      this.source,
      this.destination, [
        this.weight,
      ]);

  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;
}

// Defining a Graph Interface
enum EdgeType { directed, undirected }

abstract class Graph<E> {
  Iterable<Vertex<E>> get vertices;

  Vertex<E> createVertex(E data);

  void addEdge(
      Vertex<E> source,
      Vertex<E> destination, {
        EdgeType edgeType,
        double? weight,
      });

  List<Edge<E>> edges(Vertex<E> source);

  double? weight(
      Vertex<E> source,
      Vertex<E> destination,
      );
}

/*
** Adjacency List
    The first graph implementation you’ll learn uses an adjacency list.
    *
    For every vertex in the graph, the graph stores a list of outgoing edges.
*/
class AdjacencyList<E> implements Graph<E> {
  final Map<Vertex<E>, List<Edge<E>>> _connections = {};
  var _nextIndex = 0;

  @override
  Iterable<Vertex<E>> get vertices => _connections.keys;

  @override
  Vertex<E> createVertex(E data) {
    final vertex = Vertex(
      index: _nextIndex,
      data: data,
    );
    _nextIndex++;
    _connections[vertex] = [];
    return vertex;
  }

  /*
  ** Adding an Edge
      To connect two vertices, you need to add an edge. Recall that there are directed and undirected edges:
   */
  @override
  void addEdge(
      Vertex<E> source,
      Vertex<E> destination, {
        EdgeType edgeType = EdgeType.undirected,
        double? weight,
      }) {
    _connections[source]?.add(
      Edge(source, destination, weight),
    );
    if (edgeType == EdgeType.undirected) {
      _connections[destination]?.add(
        Edge(destination, source, weight),
      );
    }
  }

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    return _connections[source] ?? [];
  }

  /*
  ** Retrieving the Weight of an Edge:
      Recall that the weight is the cost of going from one vertex to another.
      For example, if the cost of a ticket between Singapore and Tokyo is $500, the weight of this bidirectional edge is 500:
   */
  @override
  double? weight(
      Vertex<E> source,
      Vertex<E> destination,
      ) {
    final match = edges(source).where((edge) {
      return edge.destination == destination;
    });
    if (match.isEmpty) return null;
    return match.first.weight;
  }

  /*
  ** Making Adjacency List Printable

   */
  @override
  String toString() {
    final result = StringBuffer();
    _connections.forEach((vertex, edges) {
      final destinations = edges.map((edge) {
        return edge.destination;
      }).join(', ');
      result.writeln('$vertex --> $destinations');
    });
    return result.toString();
  }
}

/*
** Adjacency Matrix
    An adjacency matrix uses a two-dimensional grid or table to implement the graph data structure.
    Each vertex has its own row and column in the table. The cells where rows and columns intersect hold the edge weights.
    If any particular cell is empty, that is, if the weight is null,
    that means there is no edge between the row vertex and the column vertex.
*/
class AdjacencyMatrix<E> implements Graph<E> {
  final List<Vertex<E>> _vertices = [];
  final List<List<double?>?> _weights = [];
  var _nextIndex = 0;

  @override
  Iterable<Vertex<E>> get vertices => _vertices;

  /*
  ** Creating a Vertex
      For every new vertex that you create, you have to add an additional column and row to the matrix.
   */
  @override
  Vertex<E> createVertex(E data) {
    final vertex = Vertex(
      index: _nextIndex,
      data: data,
    );
    _nextIndex++;
    _vertices.add(vertex);
    for (var i = 0; i < _weights.length; i++) {
      _weights[i]?.add(null);
    }
    final row = List<double?>.filled(
      _vertices.length,
      null,
      growable: true,
    );
    _weights.add(row);
    return vertex;
  }

  /*
  ** Adding Edges
      Creating edges is as simple as adding weights to the matrix. There’s no Edge class to worry about.
   */
  @override
  void addEdge(
      Vertex<E> source,
      Vertex<E> destination, {
        EdgeType edgeType = EdgeType.undirected,
        double? weight,
      }) {
    _weights[source.index]?[destination.index] = weight;
    if (edgeType == EdgeType.undirected) {
      _weights[destination.index]?[source.index] = weight;
    }
  }

  // Retrieving the Outgoing Edges From a Vertex:
  @override
  List<Edge<E>> edges(Vertex<E> source) {
    List<Edge<E>> edges = [];
    for (var column = 0; column < _weights.length; column++) {
      final weight = _weights[source.index]?[column];
      if (weight == null) continue;
      final destination = _vertices[column];
      edges.add(Edge(source, destination, weight));
    }
    return edges;
  }

  /*
  ** Retrieving the Weight of an Edge:
      It’s easy to get the weight of an edge. Simply look up the value in the adjacency matrix.
   */
  @override
  double? weight(Vertex<E> source, Vertex<E> destination) {
    return _weights[source.index]?[destination.index];
  }

  // Making an Adjacency Matrix Printable:
  @override
  String toString() {
    final output = StringBuffer();
    for (final vertex in _vertices) {
      output.writeln('${vertex.index}: ${vertex.data}');
    }
    for (int i = 0; i < _weights.length; i++) {
      for (int j = 0; j < _weights.length; j++) {
        final value = (_weights[i]?[j] ?? '.').toString();
        output.write(value.padRight(6));
      }
      output.writeln();
    }
    return output.toString();
  }
}


