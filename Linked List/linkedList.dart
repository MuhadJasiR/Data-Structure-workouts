class Node {
  int data;
  Node? next;
  Node? previous;

  Node(this.data);
}

class LinkedList {
  Node? head;
  Node? tail;

  addNode(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
      newNode.previous = tail;
    }
    tail = newNode;
  }

  deleteNode(int data) {
    Node? temp = head, prev;

    if (temp != null && temp.data == data) {
      head = head!.next;
      return;
    }
    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }

    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail = prev;
      tail!.next == null;
    }
    prev!.next = temp.next;
  }

  void display() {
    Node? temp = head;
    if (head == null) {
      print("Linked list is Empty");
    } else {
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }
}

void main(List<String> args) {
  LinkedList list = LinkedList();
  list.addNode(10);
  list.addNode(20);
  list.addNode(30);
  list.addNode(40);
  list.addNode(50);
  list.deleteNode(50);
  list.display();
}
