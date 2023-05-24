class TrieNode {
  Map<String, TrieNode?> children = {};
}

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = '*';
  Trie(String str) {
    populateSuffix(str);
  }
  void populateSuffix(String str) {
    for (int i = 0; i < str.length; i++) {
      insertSubstring(i, str);
    }
  }

  void insertSubstring(int index, String str) {
    TrieNode node = root;
    for (int i = index; i < str.length; i++) {
      String letter = str[i];
      if (!node.children.containsKey(letter)) {
        TrieNode newNode = TrieNode();
        node.children[letter] = newNode;
      }
      node = node.children[letter]!;
    }
    node.children[endSymbol] = null;
  }

  bool contains(String str) {
    TrieNode node = root;
    for (int i = 0; i < str.length; i++) {
      String letter = str[i];
      if (!node.children.containsKey(letter)) {
        return false;
      }
      node = node.children[letter]!;
    }
    return node.children.containsKey(endSymbol);
  }
}

void main(List<String> args) {
  Trie tr = Trie('jasir');
  print(tr.contains('jasir'));
}
