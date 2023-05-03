class Node {
  int data;
  Node? next;

  Node(this.data);
}

class Queue {
  Node? front;
  Node? rear;

  enqueue(int data) {
    Node newNode = Node(data);
    if (front == null) {
      front = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  dequeue() {
    if (front == null) {
      print("null");
    } else {
      front = front!.next;
    }
  }

  void display() {
    Node? current = front;
    if (front == null) {
      print("null");
    } else {
      while (current != null) {
        print(current.data);
        current = current.next;
      }
    }
  }
}

void main(List<String> args) {
  Queue queue = Queue();
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);
  queue.dequeue();
  queue.display();
}
