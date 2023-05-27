class Graph {
  late int vertices;
  List<List<int>>? adjacencyList;

  Graph(int v) {
    vertices = v;
    adjacencyList = List<List<int>>.generate(v, (index) => []);
  }

  void addEdge(int src, int dest) {
    adjacencyList![src].add(dest);
  }

  void dfs(int startVertex) {
    List<bool> visited = List<bool>.filled(vertices, false);
    _dfsUtil(startVertex, visited);
  }

  void _dfsUtil(int vertex, List<bool> visited) {
    visited[vertex] = true;
    print(vertex);

    for (int adjVertex in adjacencyList![vertex]) {
      if (!visited[adjVertex]) {
        _dfsUtil(adjVertex, visited);
      }
    }
  }
}

void main() {
  Graph graph = Graph(4);

  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 0);
  graph.addEdge(2, 3);
  graph.addEdge(3, 3);

  print("Depth-First Traversal (DFS):");
  graph.dfs(2);
}
