binarySearch(List array, int target) {
  int start = 0;
  int end = array.length - 1;

  while (start <= end) {
    int mid = (start + end) ~/ 2;
    int midValue = array[mid];

    if (midValue == target) {
      return mid;
    } else if (midValue > target) {
      start = mid + 1;
    } else {
      end = mid - 1;
    }
  }
  return -1;
}

void main(List<String> args) {
  List array = [1, 2, 3, 4, 5, 6, 7];
  int target = -4;
  int result = binarySearch(array, target);
  if (result != -1) {
    print("your searched vlue $target at index of $result");
  } else {
    print("not found $target");
  }
}
