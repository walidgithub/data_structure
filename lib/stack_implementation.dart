import 'package:dart_data_structure/stack_class.dart';

void testStack(){
// LIFO (last-in-first-out)

// ** local variables in memory managed using stack
// Memory allocation uses stacks at the architectural level. Memory for local variables is also managed using a stack

// ** recursion function uses stack
// Programming languages that support recursion manage the function calls with a stack. If you accidentally write an infinite recursion, you’ll get a stack overflow.


// ** Search and conquer algorithms, such as finding a path out of a maze, use stacks to facilitate backtracking.

  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  // print('after pushing from 1 to 4 >> $stack');

  //------------------------------------------

  final element = stack.pop();
  // print('then pop one item >> $element');
  // print('************');
  // print('after popping >> $stack');

  //-------------------------------------------

  // convert list to stack
  const list = ['S', 'M', 'O', 'K', 'E'];
  final smokeStack = Stack.of(list);
  print(smokeStack);

  // Challenge 2: Balance the Parentheses

}