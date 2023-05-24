class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class Bts {
  Node? root;

  insertion(int data) {
    Node? current = root;
    Node newNode = Node(data);
    if (root == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (data < current!.data) {
        if (current.left == null) {
          current.left = newNode;
          break;
        } else {
          current = current.left;
        }
      } else {
        if (current.right == null) {
          current.right = newNode;
          break;
        } else {
          current = current.right;
        }
      }
    }
  }

  contains(int data) {
    Node? current = root;
    while (current != null) {
      if (data < current.data) {
        current = current.left;
      } else if (data > current.data) {
        current = current.right;
      } else {
        return true;
      }
    }
    return false;
  }

  remove(int data) {
    removeHelper(data, root, null);
  }

  void removeHelper(int data, Node? currentNode, Node? parent) {
    while (currentNode != null) {
      if (data < currentNode.data) {
        parent = currentNode;
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        parent = currentNode;
        currentNode = currentNode.right;
      } else {
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = minValue(currentNode.right);
          removeHelper(currentNode.data, currentNode.right, currentNode);
        } else {
          if (parent == null) {}
        }
      }
    }
  }

  int minValue(Node? currentNode) {
    if (currentNode!.left == null) {
      return currentNode.data;
    } else {
      return minValue(currentNode.left);
    }
  }
}
