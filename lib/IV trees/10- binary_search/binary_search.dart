// Two conditions need to be met for the type of binary search
/*
1- The collection must be sorted.
2- The underlying collection must be able to perform random index lookup in constant time.
 */

// Steps:

// Step 1: Find the Middle Index of the collection

// Step 2: Check the Element at the Middle Index >>
//         If it matches the value you’re looking for, return the index.

// Step 3: Recursively Call Binary Search
/*
you’ll only consider the elements exclusively to the left or to the right of the middle index,
 depending on the value you’re searching for. If the value you’re searching for is less than the middle value,
 you search the left subsequence.
 If it is greater than the middle value, you search the right subsequence.
 */

extension SortedList<E extends Comparable<dynamic>> on List<E> {
  int? binarySearch(E value, [int? start, int? end]) {
    // 1
    final startIndex = start ?? 0;
    final endIndex = end ?? length;
    // 2
    if (startIndex >= endIndex) {
      return null;
    }
    // 3
    final size = endIndex - startIndex;
    final middle = startIndex + size ~/ 2;
    // 4
    if (this[middle] == value) {
      return middle;
    // 5
    } else if (value.compareTo(this[middle]) < 0) {
      return binarySearch(value, startIndex, middle);
    } else {
      return binarySearch(value, middle + 1, endIndex);
    }
  }
}

/*
1- Binary search is only a valid algorithm on sorted collections.
2- Sometimes it may be beneficial to sort a collection to leverage the binary search capability for looking up elements.
3- The indexOf method on List uses a linear search with O(n) time complexity. Binary search has O(log n) time complexity, which scales much better for large data sets if you are doing repeated lookups.
    Prev
 */
