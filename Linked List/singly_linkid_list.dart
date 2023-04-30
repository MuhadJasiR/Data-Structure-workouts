// class Node {
//   int data;
//   Node? next;
//   Node? prev;
//   Node(this.data);
// }

// class LinkedList {
//   Node? head;
//   Node? tail;

//   insertNode(int data) {
//     Node newNode = Node(data);

//     if (head == null) {
//       head = newNode;
//     } else {
//       tail!.next = newNode;
//     }
//     tail = newNode;
//   }

//   deleteNode(int data) {
//     Node? temp = head, previous;

//     if (temp != null && temp.data == data) {
//       head = temp.next;
//       return;
//     }

//     while (temp != null && temp.data != data) {
//       previous = temp;
//       temp = temp.next;
//     }

//     if (temp == null) {
//       return;
//     }

//     if (temp == tail) {
//       tail = previous;
//       tail!.next == null;
//     }

//     previous!.next = temp.next;
//   }

//   insertAfter(int after, int data) {
//     Node newNode = Node(data);
//     Node? temp = head;
//     while (temp != null && temp.data != after) {
//       temp = temp.next;
//     }

//     if (temp == null) {
//       return;
//     }

//     if (temp == tail) {
//       tail!.next = newNode;
//       tail = newNode;
//       return;
//     }

//     newNode.next = temp.next;
//     temp.next = newNode;
//   }

//   insertingAtHead(int data) {
//     Node newNode = Node(data);
//     Node? temp = head;
//     if (temp == null) {
//       return;
//     }
//     newNode.next = temp;
//     head = newNode;
//   }

//   updateNode(int value, int data) {
//     Node? temp = head;
//     while (temp != null && temp.data != value) {
//       temp = temp.next;
//     }
//     if (temp == null) {
//       return;
//     }
//     if (temp.data == value) {
//       temp.data = data;
//       return;
//     }
//   }

//   void display() {
//     Node? temp = head;
//     if (temp == null) {
//       print("Linked list is Empty");
//     } else {
//       while (temp != null) {
//         print(temp.data);
//         temp = temp.next;
//       }
//     }
//   }
// }

// void main(List<String> args) {
//   List<int> array = [1, 2, 3, 4, 5, 6];
//   LinkedList list = LinkedList();
//   list.insertNode(10);
//   list.insertNode(20);
//   list.insertNode(30);
//   list.insertNode(40);
//   list.deleteNode(10);
//   list.insertAfter(30, 29);
//   list.updateNode(29, 0);
//   list.insertingAtHead(80);
//   list.display();
// }

class Node {
  int data;
  Node? next;
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
    }
    tail = newNode;
  }

  deleteNode(int data) {
    Node? temp = head;
    Node? previous;
    if (head!.data == data) {
      head = temp!.next;
      return;
    }
    while (temp != null && temp.data != data) {
      previous = temp;
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }

    if (tail == data) {
      tail = previous;
      tail!.next = null;
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

    if (temp!.data == tail) {
      tail!.next = newNode;
      return;
    }
    newNode.next = temp.next;
    temp.next = newNode;
  }

  updateNode(int oldValue, int newValue) {
    Node? temp = head;
    while (temp != null && temp.data != oldValue) {
      temp = temp.next;
    }
    temp!.data = newValue;
  }

  void display() {
    if (head == null) {
      print("Empty");
      return;
    }
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main(List<String> args) {
  LinkedList list = LinkedList();
  list.addNewNode(10);
  list.addNewNode(11);
  list.addNewNode(12);
  list.addNewNode(13);
  list.addNewNode(14);
  list.deleteNode(10);
  list.insertAfter(14, 20);
  list.updateNode(11, 1010);
  list.display();
}
