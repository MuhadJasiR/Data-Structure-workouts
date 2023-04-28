class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head = null;
  Node? tail = null;

  addNewNode(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  deleteNode(int data) {
    Node? temp = head;
    Node? previous;
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
      return;
    }
    previous!.next = temp.next;
  }

  insertAfter(int nextTo, int data) {
    Node newNode = Node(data);
    Node? temp = head;
    while (temp != null && temp.data != nextTo) {
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

  void display() {
    Node? temp = head;
    if (temp == null) {
      print("linked list is empty");
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
  list.deleteNode(20);
  list.insertAfter(10, 40);
  list.display();
}
