void otherInfo() {
  final shared = List.filled(3, []);
  shared[0].add(499);
  print(shared); // [[499], [499], [499]]
// You can use List.generate to create a list with a fixed length and a new object at each position.

  final unique = List.generate(3, (_) => []);
  unique[0].add(499);
  print(unique); // [[499], [], []]
}
