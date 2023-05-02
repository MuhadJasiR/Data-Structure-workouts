class Node {
  int data;
  Node? next;

  Node(this.data);
}

class Stack {
  Node? top;

  push(int data) {
    Node newNode = Node(data);

    if (top == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  pop() {
    if (top == null) {
      print("stack underflow");
      return;
    }
    top = top!.next;
  }

  void display() {
    Node? current = top;
    if (current == null) {
      print("stack underflow");
    } else {
      while (current != null) {
        print(current.data);
        current = current.next;
      }
    }
  }
}

void main(List<String> args) {
  Stack stack = Stack();
  stack.push(10);
  stack.push(20);
  stack.push(30);
  stack.push(40);
  stack.pop();
  stack.pop();
  stack.pop();
  stack.display();
}
