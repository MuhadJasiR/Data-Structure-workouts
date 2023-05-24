class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class Bst {
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
    print("object");
  }

  remove(int data) {
    removeHelper(data, root, null);
  }

  removeHelper(int data, Node? currentNode, Node? parentNode) {
    while (currentNode != null) {
      if (data < currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = minValue(currentNode.right);
          removeHelper(currentNode.data, currentNode.right, currentNode);
        } else {
          if (parentNode == null) {
            if (currentNode.right == null) {
              root = currentNode.left;
            } else {
              root = currentNode.right;
            }
          } else {
            if (parentNode.left == currentNode) {
              if (currentNode.right == null) {
                parentNode.left = currentNode.left;
              } else {
                parentNode.left = currentNode.right;
              }
            } else {
              if (currentNode.right == null) {
                parentNode.right = currentNode.left;
              } else {
                parentNode.right = currentNode.right;
              }
            }
          }
        }
        break;
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

  isValidBst(Node root) {
    return isValidBstHelper(root, null, null);
  }

  inOrder() {
    inOrderHelper(root);
  }

  void inOrderHelper(Node? currentNode) {
    if (currentNode != null) {
      inOrderHelper(currentNode.left);
      print(currentNode.data);
      inOrderHelper(currentNode.right);
    }
  }

  preOrder() {
    preOrderHelper(root);
  }

  void preOrderHelper(Node? currentNode) {
    if (currentNode != null) {
      print(currentNode.data);
      preOrderHelper(currentNode.left);
      preOrderHelper(currentNode.right);
    }
  }

  isValidBstHelper(Node? node, int? min, int? max) {
    if (node == null) {
      return true;
    }

    if ((min != null && node.data <= min) ||
        (max != null && node.data >= max)) {
      return false;
    }

    return isValidBstHelper(node.left, min, node.data) &&
        isValidBstHelper(node.right, node.data, max);
  }
}

void main(List<String> args) {
  Bst bst = Bst();
  bst.insertion(10);
  bst.insertion(20);
  bst.insertion(30);
  bst.insertion(40);
  // bst.remove(20);
  // print(bst.contains(20));
  bst.remove(20);
  bst.inOrder();
  print("");
  bst.preOrder();
}
