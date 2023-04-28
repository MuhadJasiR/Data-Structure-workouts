import 'dart:ffi';

addTwoNumber(List array, int number) {
  Set? setsList = {};
  for (int i = 0; i < array.length - 1; i++) {
    int nums = array[i];
    int match = number - nums;
    if (setsList.contains(match)) {
      print({nums, match});
    } else {
      setsList.add(nums);
    }
  }
}

moveToLast(List array, int number) {
  for (int i = 0; i < array.length; i++) {
    for (int j = array.length - 1; j >= 0; j--) {
      if (array[j] == number) {
      } else {
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
      }
    }
    print(array);
  }
}

void main() {
  List<int> array1 = [6, 5, 6, 9, 4, 0, 2, 6];
  int a = 6;
  // addTwoNumber(array1, a);
  moveToLast(array1, a);
}
