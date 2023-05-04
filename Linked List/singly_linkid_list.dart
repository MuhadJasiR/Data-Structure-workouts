class Node {
  int data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class LinkedList {
  Node? head;
  Node? tail;

  insertNode(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  deleteNode(int data) {
    Node? temp = head, previous;

    if (temp != null && temp.data == data) {
      head = temp.next;
      return;
    }

    while (temp != null && temp.data != data) {
      previous = temp;
      temp = temp.next;
    }

    if (temp == null) {
      return;
    }

    if (temp == tail) {
      tail = previous;
      tail!.next == null;
    }

    previous!.next = temp.next;
  }

  insertAfter(int after, int data) {
    Node newNode = Node(data);
    Node? temp = head;
    while (temp != null && temp.data != after) {
      temp = temp.next;
    }

    if (temp == null) {
      return;
    }

    if (temp == tail) {
      tail!.next = newNode;
      tail = newNode;
      return;
    }

    newNode.next = temp.next;
    temp.next = newNode;
  }

  insertingAtHead(int data) {
    Node newNode = Node(data);
    Node? temp = head;
    if (temp == null) {
      return;
    }
    newNode.next = temp;
    head = newNode;
  }

  updateNode(int value, int data) {
    Node? temp = head;
    while (temp != null && temp.data != value) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp.data == value) {
      temp.data = data;
      return;
    }
  }

  void display() {
    Node? temp = head;
    if (temp == null) {
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
  list.insertNode(10);
  list.insertNode(20);
  list.insertNode(30);
  list.insertNode(40);
  list.deleteNode(10);
  list.insertAfter(30, 29);
  list.updateNode(29, 0);
  list.insertingAtHead(80);
  list.display();
}
