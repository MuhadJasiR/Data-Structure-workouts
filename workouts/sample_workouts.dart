class Node {
  int data;
  Node? next;

  Node(this.data);
}

class Stack {
  Node? top;
  int? count;
  push(int data) {
    Node newNode = Node(data);
    if (top == null) {
      top == newNode;
    } else {
      newNode.next = top;
    }
    top = newNode;
  }

  middleValue() {
    Node? current = top;
    if (current == null) {
      print("empty stack");
    } else {
      while (current != null) {
        current = current.next;
      }
    }
  }

  pop() {
    if (top == null) {
      print("empty");
    } else {
      top = top!.next;
    }
  }

  deleteMiddle() {
    if (top == null || top!.next == null) {
      print("stack is empty or only have one element");
      return;
    }
    Node? slowPtr = top;
    Node? fastPtr = top;
    Node? prev;

    while (fastPtr != null && fastPtr.next != null) {
      prev = slowPtr;
      slowPtr = slowPtr!.next;
      fastPtr = fastPtr.next!.next;
    }

    prev!.next = slowPtr!.next;
    slowPtr.next = null;
  }

  void display() {
    Node? current = top;
    if (current == null) {
      print("empty");
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
  // stack.pop();
  stack.deleteMiddle();
  stack.display();
}
