quickSort(List arr, int start, int end) {
  if (end <= start) {
    return;
  }
  int pivot = partitionSort(arr, start, end);
  quickSort(arr, start, pivot - 1);
  quickSort(arr, pivot + 1, end);
}

int partitionSort(List arr, int start, int end) {
  int i = start - 1;
  int pivot = arr[end];
  for (var j = start; j < end; j++) {
    if (arr[j] < pivot) {
      i++;
      int temp = arr[j];
      arr[j] = arr[i];
      arr[i] = temp;
    }
  }
  i++;
  int temp = arr[i];
  arr[i] = arr[end];
  arr[end] = temp;
  return i;
}

void main(List<String> args) {
  List arr = [9, 1, 8, 2, 7, 3, 4, 6, 5];
  print(arr);
  quickSort(arr, 0, arr.length - 1);
  print(arr);
}
