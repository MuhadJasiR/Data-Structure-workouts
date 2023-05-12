insertionSort(List arr) {
  for (var i = 0; i < arr.length - 1; i++) {
    int temp = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > temp) {
      arr[j + 1] = arr[j];
      j--;
    }

    arr[j + 1] = temp;
  }
}

void main(List<String> args) {
  List arr = [3, 1, 5, 2, 6];
  insertionSort(arr);
  print(arr);
}
