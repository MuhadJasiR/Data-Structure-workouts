// class Heap {
//   List heap = [];
//   Heap(List array) {
//     buildHeap(array);
//   }
//   void buildHeap(List array) {
//     heap = array;
//     for (int i = getParent(heap.length - 1); i >= 0; i--) {
//       shiftDown(i);
//     }
//   }

//   void shiftUp(int current) {
//     int parentIdx = getParent(current);
//     while (
//         current >= 0 && heap.elementAt(parentIdx) > heap.elementAt(current)) {
//       swap(current, parentIdx);
//       current = parentIdx;
//       parentIdx = getParent(current);
//     }
//   }

//   void shiftDown(int current) {
//     int lastIdx = heap.length - 1;
//     int leftIdx = getLeftChild(current);
//     while (leftIdx <= lastIdx) {
//       int rightIdx = getRightChild(current);
//       int shiftIdx = leftIdx;
//       if (rightIdx <= lastIdx &&
//           heap.elementAt(rightIdx) < heap.elementAt(leftIdx)) {
//         shiftIdx = rightIdx;
//       }
//       if (heap.elementAt(shiftIdx) < heap.elementAt(current)) {
//         swap(shiftIdx, current);
//         current = shiftIdx;
//         leftIdx = getLeftChild(current);
//       }
//     }
//   }

//   void peek() {
//     print(heap[0]);
//   }

//   void remove() {
//     swap(0, heap.length - 1);
//     heap.removeLast();
//     shiftDown(0);
//   }

//   void insert(int value) {
//     heap.add(value);
//     shiftUp(heap.length - 1);
//   }

//   int getParent(int i) {
//     return (i - 1) ~/ 2;
//   }

//   int getLeftChild(int i) {
//     return (i * 2) + 1;
//   }

//   int getRightChild(int i) {
//     return (i * 2) + 2;
//   }

//   void display() {
//     print(heap);
//   }

//   void swap(int i, int j) {
//     int temp = heap[i];
//     heap[i] = heap[j];
//     heap[j] = temp;
//   }
// }

// void main() {
//   List<int> array = [4, 8, 9, 1, 3, 2, 8];
//   Heap heap = Heap(array);
//   heap.display();
//   heap.peek();
//   heap.remove();
//   heap.display();
// }

class Heap {
  List heap = [];

  Heap(this.heap);

  buildHeap(List arr) {
    heap = arr;
    for (var i = getParentIdx(heap.length - 1); i > 0; i--) {
      shiftDown(i);
    }
  }

  getParentIdx(int i) {
    return (i - 1) ~/ 2;
  }

  getLeftIdx(int i) {
    return (i * 2) + 1;
  }

  getRightIdx(int i) {
    return (i * 2) + 2;
  }

  swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  void shiftDown(int currentIdx) {
    int endIdx = heap.length - 1;
    int leftIdx = getLeftIdx(currentIdx);
    while (leftIdx <= endIdx) {
      int rightIdx = getRightIdx(currentIdx);
      int idxToShift;
      if (rightIdx <= endIdx &&
          heap.elementAt(rightIdx) < heap.elementAt(leftIdx)) {
        idxToShift = rightIdx;
      } else {
        idxToShift = leftIdx;
      }
      if (heap.elementAt(currentIdx) > heap.elementAt(idxToShift)) {
        swap(currentIdx, idxToShift);
        leftIdx = getLeftIdx(currentIdx);
      } else {
        return;
      }
    }
  }

  shiftUp(int currentIdx) {
    int parent = getParentIdx(currentIdx);
    while (
        currentIdx > 0 && heap.elementAt(parent) > heap.elementAt(currentIdx)) {
      swap(currentIdx, parent);
      currentIdx = parent;
      parent = getLeftIdx(currentIdx);
    }
  }

  void display() {
    print(heap);
  }

  insert(int value) {
    heap.add(value);
    shiftUp(heap.length - 1);
  }

  deletion() {
    swap(heap.elementAt(0), heap.elementAt(heap.length - 1));
    heap.removeLast();
    shiftDown(0);
  }
}

void main(List<String> args) {
  List arr = [10, 40, 20, 50];
  Heap heap = Heap(arr);
  heap.insert(10);
  heap.insert(20);
  heap.insert(30);
  heap.insert(40);
  heap.insert(50);
  heap.display();
}
