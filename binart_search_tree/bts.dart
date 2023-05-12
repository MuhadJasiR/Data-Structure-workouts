class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BinarySearchTree {
  Node? root;
  insertion(int data) {
    Node? currentNode = root;

    Node newNode = Node(data);
    if (root == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (data < currentNode!.data) {
        if (currentNode.left == null) {
          currentNode.left = newNode;
          break;
        } else {
          currentNode = currentNode.left;
        }
      } else {
        if (currentNode.right == null) {
          currentNode.right = newNode;
          break;
        } else {
          currentNode = currentNode.right;
        }
      }
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
}

void main(List<String> args) {
  BinarySearchTree binarySearchTree = BinarySearchTree();
  binarySearchTree.insertion(10);
  binarySearchTree.insertion(11);
  binarySearchTree.insertion(12);
  print(binarySearchTree.contains(11));
}
