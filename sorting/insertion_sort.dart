insertionSort(List arr) {
  for (var i = 1; i < arr.length - 1; i++) {
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
  List arr = [4, 3, 1, 6, 2, 7];
  insertionSort(arr);
  print(arr);
}
