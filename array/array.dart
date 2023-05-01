reverseArray(List array) {
  int temp;
  for (var i = 0, j = array.length - 1; i < array.length / 2; i++, j--) {
    temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }
  print(array);
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  reverseArray(numbers);
}
