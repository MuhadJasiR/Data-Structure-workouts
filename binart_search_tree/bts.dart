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
    if (data < current!.data) {
      current = current.left;
    } else if (data > current.data) {
      current = current.right;
    } else {
      return true;
    }
    return false;
  }

  remove(int data) {
    removeHelper(data, root, null);
  }

  void removeHelper(int data, Node? currentNode, Node? parentNode) {
    while (currentNode != null) {
      if (data < currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = getMinValue(currentNode.right!);
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

  getMinValue(Node currentNode) {
    if (currentNode.left == null) {
      return currentNode.data;
    } else {
      return getMinValue(currentNode.left!);
    }
  }

  void inOrder() {
    inOrderHelper(root!);
  }

  inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }

  void postOrder() {
    postOrderHelper(root!);
  }

  postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }

  void preOrder() {
    preOrderHelper(root!);
  }

  preOrderHelper(Node? node) {
    if (node != null) {
      print(node.data);
      preOrderHelper(node.left);
      preOrderHelper(node.right);
    }
  }
}

void main(List<String> args) {
  Bts bts = Bts();
  bts.insertion(10);
  bts.insertion(11);
  bts.insertion(12);
  bts.inOrder();
  print("________");
  bts.preOrder();
  print("________");
  bts.postOrder();
}
