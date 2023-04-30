class Node {
  int data;
  Node? next;
  Node? previous;

  Node(this.data);
}

class LinkedList {
  Node? head = null;
  Node? tail = null;

  addNewNode(data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      while (head != null) {
        tail!.next = newNode;
        newNode.previous = tail;
      }
    }
    tail = newNode;
  }

  void display() {
    Node? temp = tail;
    if (temp == null) {
      print("Linked list is Empty");
    } else {
      while (temp != null) {
        print(temp.data);
        temp = temp.previous;
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
  list.display();
}
