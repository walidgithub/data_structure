
//Constant Time if there millions inputs but there is one time print
void checkFirst(List<String> names) {
  if (names.isNotEmpty) {
    print(names.first);
  } else {
    print('no names');
  }
}

//Linear Time O(n) when input increase then time increase as linear 10 inputs = 10 times
void printNames(List<String> names) {
  for (final name in names) {
    print(name);
  }
}


// O(n squared) Quadratic Time >> it will multiply outer loop times in inner loop times
void printMoreNames(List<String> names) {
  for (final _ in names) {
    for (final name in names) {
      print(name);
    }
  }
}

// searching from the half of list O(log n) Logarithmic Time
// As input data increases, the time it takes to execute the algorithm increases at a slow rate
// best choice after constant time
bool betterNaiveContains(int value, List<int> list) {
  if (list.isEmpty) return false;
  // ~ to avoid error when using /
  final middleIndex = list.length ~/ 2;

  if (value > list[middleIndex]) {
    for (var i = middleIndex; i < list.length; i++) {
      if (list[i] == value) return true;
    }
  } else {
    for (var i = middleIndex; i >= 0; i--) {
      if (list[i] == value) return true;
    }
  }

  return false;
}


// Quasilinear Time O(n log n)
// better than quadratic and worse than linear
// when using List.sort;
