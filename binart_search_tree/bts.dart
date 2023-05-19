// class Node {
//   int data;
//   Node? left;
//   Node? right;
//   Node(this.data);
// }

// class BinarySearchTree {
//   Node? root;
//   insertion(int data) {
//     Node? currentNode = root;

//     Node newNode = Node(data);
//     if (root == null) {
//       root = newNode;
//       return;
//     }
//     while (true) {
//       if (data < currentNode!.data) {
//         if (currentNode.left == null) {
//           currentNode.left = newNode;
//           break;
//         } else {
//           currentNode = currentNode.left;
//         }
//       } else {
//         if (currentNode.right == null) {
//           currentNode.right = newNode;
//           break;
//         } else {
//           currentNode = currentNode.right;
//         }
//       }
//     }
//   }

//   contains(int data) {
//     Node? currentNode = root;
//     while (currentNode != null) {
//       if (data < currentNode.data) {
//         currentNode = currentNode.left;
//       } else if (data > currentNode.data) {
//         currentNode = currentNode.right;
//       } else {
//         return true;
//       }
//     }
//     return false;
//   }
// }

// void main(List<String> args) {
//   BinarySearchTree binarySearchTree = BinarySearchTree();
//   binarySearchTree.insertion(10);
//   binarySearchTree.insertion(11);
//   binarySearchTree.insertion(12);
//   print(binarySearchTree.contains(11));
// }

class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  insertion(int data) {
    Node newNode = Node(data);
    Node? current = root;
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
          currentNode.data = minValue(currentNode.right!);
          removeHelper(currentNode.data, currentNode.right, currentNode);
        } else {
          print("1");
        }
        break;
      }
    }
  }

  minValue(Node current) {
    if (current.left == null) {
      return current.left;
    } else {
      return minValue(current.left!);
    }
  }

  contains(int data) {
    Node? currentNode = root;
    while (currentNode != null) {
      if (data < currentNode.data) {
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        currentNode = currentNode.right;
      } else {
        return true;
      }
    }
    return false;
  }

  void inOrder() {
    inOrderHelper(root);
  }

  void inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }

  preOrder() {
    preOrderHelper(root);
  }

  void preOrderHelper(Node? node) {
    if (node != null) {
      print(node.data);
      preOrderHelper(node.left);
      preOrderHelper(node.right);
    }
  }

  postOrder() {
    postOrderHelper(root);
  }

  void postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }
}

void main(List<String> args) {
  BinarySearchTree tree = BinarySearchTree();
  tree.insertion(10);
  tree.insertion(8);
  tree.insertion(11);
  // tree.remove(8);
  // print(tree.contains(8));
  tree.inOrder();
  print(" ");
  tree.preOrder();
  print(" ");
  tree.postOrder();
}
