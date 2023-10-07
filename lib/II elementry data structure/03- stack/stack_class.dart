// when to use Stack

/*
Applications of Stack in problem-solving

Balanced parenthesis

· Our code editor uses a stack to check if we have closed all our parentheses properly,
 and even to prettify the code.

Backtracking

· Stacks are particularly useful when the computation has to go back in reverse order.
 This happens often in artificial intelligence applications: games, logic programs, theorem provers, etc.

Think of walking through a maze. Whenever you have options to move in more than one direction,
 push all but one of the options onto the stack and then go in the direction you didn't push.
 When you run into a dead end, walk backwards to your last option (i.e. pop the stack) and proceed from there.

Activation records

· Every time a function is called in a program, all the function’s arguments and local variables are stored
 by being pushed onto a stack. When the function exits,
  all that memory can be reclaimed by simply popping the stack back to where it was before the function call.

Reverse a word

· Put all the letters in a stack and pop them out.
 Because of the LIFO order of stack, you will get the letters in reverse order.

In compilers

· Compilers use the stack to calculate the value of expressions like 2 + 4 / 5 * (7–9) by converting
 the expression to prefix or postfix form.

In browsers

· The back button in a browser saves all the URLs you have visited previously in a stack.
 Each time you visit a new page, it is added on top of the stack. When you press the back button,
  the current URL is removed from the stack, and the previous URL is accessed.
*/

// LIFO (last-in-first-out)

// ** local variables in memory managed using stack
// Memory allocation uses stacks at the architectural level. Memory for local variables is also managed using a stack

// ** recursion function uses stack
// Programming languages that support recursion manage the function calls with a stack.
// If you accidentally write an infinite recursion, you’ll get a stack overflow.


// ** Search and conquer algorithms, such as finding a path out of a maze, use stacks to facilitate backtracking.


class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E get peek => _storage.last;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);
}