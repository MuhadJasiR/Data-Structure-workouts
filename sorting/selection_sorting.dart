selectionSorting(List array) {
  for (var i = 0; i < array.length - 1; i++) {
    int min = i;
    for (var j = i + 1; j < array.length; j++) {
      if (array[min] > array[j]) {
        min = j;
      }
    }
    int temp = array[i];
    array[i] = array[min];
    array[min] = temp;
  }
}

void main(List<String> args) {
  List array = [3, 12, 5, 2, 6, 1, 9];
  print(array);
  selectionSorting(array);
  print(array);
}
