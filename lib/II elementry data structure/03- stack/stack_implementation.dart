

// LIFO (last-in-first-out)

// ** local variables in memory managed using stack
// Memory allocation uses stacks at the architectural level. Memory for local variables is also managed using a stack

// ** recursion function uses stack
// Programming languages that support recursion manage the function calls with a stack. If you accidentally write an infinite recursion, you’ll get a stack overflow.


// ** Search and conquer algorithms, such as finding a path out of a maze, use stacks to facilitate backtracking.


import 'package:dart_data_structure/II elementry%20data%20structure/03-%20stack/stack_class.dart';

void testStack(){
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  print('after pushing from 1 to 4 >> $stack');

  //------------------------------------------

  final element = stack.pop();
  print('then pop one item >> $element');
  // print('************');
  print('after popping >> $stack');

  //-------------------------------------------

  // convert list to stack
  // const list = ['S', 'M', 'O', 'K', 'E'];
  // final smokeStack = Stack.of(list);
  // print(smokeStack);

  // However, a stack’s purpose is to limit the number of ways to access your data,
  // and adopting interfaces such as Iterable would go against this goal by exposing
  // all the elements via the iterator. In this case, less is more!


  // Big o of stack is O(1) >> insertion and removal and get an element

// -------------------------------------------------------------------------------------------------
}