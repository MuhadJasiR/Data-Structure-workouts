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
    top = newNode;
  }

  pop() {
    if (top == null) {
      print("stack if empty");
    } else {
      top = top!.next;
    }
  }

  deleteMiddle() {
    if (top == null) {
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

  display() {
    Node? current = top;
    if (top == null) {
      print("stack is empty");
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
  stack.push(50);
  stack.deleteMiddle();
  stack.display();
}
