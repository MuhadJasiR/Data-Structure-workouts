quickSort(List arr, int start, int end) {
  if (end < start) {
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
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  i++;
  int temp = arr[i];
  arr[i] = arr[end];
  arr[end] = temp;
  return i;
}

void main(List<String> args) {
  List arr = [2, 6, 1, 4, 8, 0];
  quickSort(arr, 0, arr.length - 1);
  print(arr);
}
