class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

bool isValidBST(Node root) {
  return isValidBSTHelper(root, null, null);
}

bool isValidBSTHelper(Node? node, int? min, int? max) {
  if (node == null) {
    return true;
  }

  // Check if the current node value is within the valid range
  if ((min != null && node.value <= min) ||
      (max != null && node.value >= max)) {
    return false;
  }

  // Recursively check the left and right subtrees with updated valid ranges
  return isValidBSTHelper(node.left, min, node.value) &&
      isValidBSTHelper(node.right, node.value, max);
}
