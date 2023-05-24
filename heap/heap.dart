class Heap {
  List heap = [];
  Heap(List array) {
    buildHeap(array);
  }
  void buildHeap(List array) {
    heap = array;
    for (int i = getParent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void shiftUp(int current) {
    int parentIdx = getParent(current);
    while (
        current >= 0 && heap.elementAt(parentIdx) > heap.elementAt(current)) {
      swap(current, parentIdx);
      current = parentIdx;
      parentIdx = getParent(current);
    }
  }

  void shiftDown(int current) {
    int lastIdx = heap.length - 1;
    int leftIdx = getLeftChild(current);
    while (leftIdx <= lastIdx) {
      int rightIdx = getRightChild(current);
      int shiftIdx = leftIdx;
      if (rightIdx <= lastIdx &&
          heap.elementAt(rightIdx) < heap.elementAt(leftIdx)) {
        shiftIdx = rightIdx;
      }
      if (heap.elementAt(shiftIdx) < heap.elementAt(current)) {
        swap(shiftIdx, current);
        current = shiftIdx;
        leftIdx = getLeftChild(current);
      }
    }
  }

  void peek() {
    print(heap[0]);
  }

  void remove() {
    swap(0, heap.length - 1);
    heap.removeLast();
    shiftDown(0);
  }

  void insert(int value) {
    heap.add(value);
    shiftUp(heap.length - 1);
  }

  int getParent(int i) {
    return (i - 1) ~/ 2;
  }

  int getLeftChild(int i) {
    return (i * 2) + 1;
  }

  int getRightChild(int i) {
    return (i * 2) + 2;
  }

  void display() {
    print(heap);
  }

  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}

void main() {
  List<int> array = [4, 8, 9, 1, 3, 2, 8];
  Heap heap = Heap(array);
  heap.display();
  heap.peek();
  heap.remove();
  heap.display();
}
