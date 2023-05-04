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
      print("null");
    } else {
      top = top!.next;
    }
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
  Stack list = Stack();
  list.push(10);
  list.push(20);
  list.push(30);
  list.push(40);
  list.push(50);
  list.pop();
  list.display();
}
