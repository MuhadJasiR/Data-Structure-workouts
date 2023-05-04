insertionSort(List array) {
  for (var i = 0; i < array.length - 1; i++) {
    int key = array[i];
    int j = i - 1;
    while (j >= 0 && array[j] > key) {
      array[j + 1] = array[j];
      j--;
    }
    array[j + 1] = key;
  }
}

void main(List<String> args) {
  List array = [3, 6, 1, 4, 2, 7];
  insertionSort(array);
  print(array);
}
