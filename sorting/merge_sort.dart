mergeSort(List arr) {
  int length = arr.length;
  if (length <= 1) {
    return;
  }

  int middle = arr.length ~/ 2;
  List leftArray = List.filled(middle, 0);
  List rightArray = List.filled(arr.length - middle, 0);

  int i = 0, j = 0;

  for (; i < arr.length; i++) {
    if (i < middle) {
      leftArray[i] = arr[i];
    } else {
      rightArray[j] = arr[i];
      j++;
    }
  }

  mergeSort(leftArray);
  mergeSort(rightArray);
  merge(arr, leftArray, rightArray);
}

void merge(List arr, List leftArray, List rightArray) {
  int i = 0, l = 0, r = 0;

  int leftSize = arr.length ~/ 2;
  int rightSize = arr.length - leftSize;

  while (l < leftSize && r < rightSize) {
    if (leftArray[l] < rightArray[r]) {
      arr[i] = leftArray[l];
      i++;
      l++;
    } else {
      arr[i] = rightArray[r];
      i++;
      r++;
    }
  }
  while (l < leftSize) {
    arr[i] = leftArray[l];
    i++;
    l++;
  }
  while (r < rightSize) {
    arr[i] < rightArray[r];
    i++;
    r++;
  }
}

void main(List<String> args) {
  List arr = [7, 1, 3, 9, 8, 2, 4, 5];
  print(arr);
  mergeSort(arr);
  print(arr);
}
