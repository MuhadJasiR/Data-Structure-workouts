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
