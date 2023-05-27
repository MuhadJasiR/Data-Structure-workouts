void main(List<String> args) {
  List arr = [1, 22, 35, 42, 55, 61, 73, 82];
  int target = 61;
  int ans = binarySearch(arr, target);
  if (ans == -1) {
    print("$target not found");
  } else {
    print("$target is found at the index ${ans + 1}");
  }
}

int binarySearch(List arr, int target) {
  int start = 0;
  int end = arr.length - 1;
  while (start <= end) {
    int mid = (start + end) ~/ 2;
    int midValue = arr[mid];
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
