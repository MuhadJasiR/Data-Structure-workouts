binarySearch(List array, target) {
  int start = 0;
  int end = array.length - 1;
  while (start <= end) {
    int mid = (start + end) ~/ 2;
    int midValue = array[mid];
    if (midValue == target) {
      return mid;
    } else if (midValue < target) {
      start = mid + 1;
    } else {
      end = mid - 1;
    }
  }
  return -1;
}

void main(List<String> args) {
  List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int target = 6;
  int result = binarySearch(array, target);
  if (result == -1) {
    print("not found");
  } else {
    print("value $target found at index of ${result + 1}");
  }
}
