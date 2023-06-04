class Graph {
    var adjacencyList: [Int: [Int]]
    
    init() {
        adjacencyList = [:]
    }
    
    func addEdge(_ source: Int, _ destination: Int) {
        if adjacencyList[source] == nil {
            adjacencyList[source] = []
        }
        adjacencyList[source]?.append(destination)
    }
    
    func dfsTraversal(_ startNode: Int) {
        var visited: Set<Int> = []
        dfsHelper(startNode, visited)
    }
    
    private func dfsHelper(_ currentNode: Int, _ visited: Set<Int>) {
        print(currentNode)
        var updatedVisited = visited
        updatedVisited.insert(currentNode)
        
        if let neighbors = adjacencyList[currentNode] {
            for neighbor in neighbors {
                if !updatedVisited.contains(neighbor) {
                    dfsHelper(neighbor, updatedVisited)
                }
            }
        }
    }
}

let graph = Graph()
graph.addEdge(0, 1)
graph.addEdge(0, 2)
graph.addEdge(1, 3)
graph.addEdge(1, 4)
graph.addEdge(2, 5)
graph.addEdge(3, 6)
graph.addEdge(4, 6)

print("DFS Traversal:")
graph.dfsTraversal(0)
