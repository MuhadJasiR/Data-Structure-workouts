bubbleSorting(List array) {
  int n = array.length - 1;
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < n - i; j++) {
      if (array[j] > array[j + 1]) {
        int temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
}

void main() {
  List<int> arr = [3, 1, 5, 2, 7, 4];

  bubbleSorting(arr);
  print(arr);
}
