class Node {
  int data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class LinkedList {
  Node? head;
  Node? tail;

  addNewNode(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
    }
    tail = newNode;
  }

  deleteNode(int data) {
    Node? temp = head, prev;

    if (temp != null && temp.data == data) {
      head = temp.next;
      return;
    }
    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }
    if (temp == tail) {
      tail = prev;
      tail!.next = null;
      return;
    }
    prev!.next = temp!.next;
  }

  update(int oldValue, int newValue) {
    Node? temp = head;
    while (temp != null && temp.data != oldValue) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    temp.data = newValue;
  }

  void display() {
    Node? temp = head;
    if (temp == null) {
      print("Empty");
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
  list.addNewNode(10);
  list.addNewNode(20);
  list.addNewNode(30);
  list.addNewNode(40);
  list.addNewNode(50);
  list.deleteNode(50);
  list.display();
}
