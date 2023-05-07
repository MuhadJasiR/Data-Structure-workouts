void main(List<String> args) {
  List<int> array = [4, 8, 9, 1, 3, 2, 8];

  mergeSort(array);
  print(array);
}

void mergeSort(List<int> array) {
  int length = array.length;
  if (length <= 1) {
    return;
  }
  int middle = array.length ~/ 2;
  int i = 0, j = 0;
  List<int> leftArray = List<int>.filled(middle, 0);
  List<int> rightArray = List<int>.filled(array.length - middle, 0);
  for (; i < array.length; i++) {
    if (i < middle) {
      leftArray[i] = array[i];
    } else {
      rightArray[j] = array[i];
      j++;
    }
  }

  mergeSort(leftArray);
  mergeSort(rightArray);
  merge(array, leftArray, rightArray);
}

void merge(List<int> array, List<int> leftArray, List<int> rightArray) {
  int i = 0, l = 0, r = 0;
  int leftSize = array.length ~/ 2;
  int rightSize = array.length - leftSize;
  while (l < leftSize && r < rightSize) {
    if (leftArray[l] < rightArray[r]) {
      array[i] = leftArray[l];
      l++;
      i++;
    } else {
      array[i] = rightArray[r];
      r++;
      i++;
    }
  }

  while (l < leftSize) {
    array[i] = leftArray[l];
    l++;
    i++;
  }
  while (r < rightSize) {
    array[i] = rightArray[r];
    r++;
    i++;
  }
}
