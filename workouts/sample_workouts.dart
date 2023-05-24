class Heap {
  List heap = [];

  Heap(List array) {
    buildHeap(array);
  }

  buildHeap(List arr) {
    heap = arr;
    for (var i = getParentNode(heap.length - 1); i > 0; i--) {
      shiftDown(i);
    }
  }

  insert(int data) {
    heap.add(data);
    shiftUp(data);
  }

  display() {
    print(heap);
  }

  shiftDown(int current) {
    int endIdx = heap.length - 1;
    int leftIdx = getLeftChild(current);
    while (leftIdx <= endIdx) {
      int rightIdx = getRightChild(current);
      int shiftIdx;
      if (rightIdx <= endIdx &&
          heap.elementAt(rightIdx) < heap.elementAt(leftIdx)) {
        shiftIdx = rightIdx;
      } else {
        shiftIdx = leftIdx;
      }

      if (heap.elementAt(shiftIdx) < heap.elementAt(current)) {
        swap(shiftIdx, current);
        current = shiftIdx;
        leftIdx = getLeftChild(current);
      } else {
        return;
      }
    }
  }

  shiftUp(int current) {
    int parentNode = getParentNode(current);
    while (
        current > 0 && heap.elementAt(parentNode) > heap.elementAt(current)) {
      swap(current, parentNode);
      current = parentNode;
      parentNode = getParentNode(current);
    }
  }

  getLeftChild(int i) {
    return (i * 2) + 1;
  }

  getRightChild(int i) {
    return (i * 2) + 2;
  }

  getParentNode(int i) {
    return (i - 1) ~/ 2;
  }

  swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}

void main(List<String> args) {
  List arr = [1, 5, 2, 3];

  Heap heap = Heap(arr);
  heap.insert(4);
  heap.insert(7);
  heap.display();
}
