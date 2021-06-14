/*
1245. Tree Diameter

Given an undirected tree, return its diameter: the number of edges in a longest path in that tree.

The tree is given as an array of edges where edges[i] = [u, v] is a bidirectional edge between nodes u and v.  Each node has labels in the set {0, 1, ..., edges.length}.

 

Example 1:

Input: edges = [[0,1],[0,2]]
Output: 2
Explanation: 
A longest path of the tree is the path 1 - 0 - 2.

Example 2:

Input: edges = [[0,1],[1,2],[2,3],[1,4],[4,5]]
Output: 4
Explanation: 
A longest path of the tree is the path 3 - 2 - 1 - 4 - 5.

 

Constraints:

    0 <= edges.length < 10^4
    edges[i][0] != edges[i][1]
    0 <= edges[i][j] <= edges.length
    The given edges form an undirected tree.

https://leetcode.com/problems/tree-diameter/
*/
class Solution {
    func treeDiameter(_ edges: [[Int]]) -> Int {
        var visited = [Bool](repeating: false, count: edges.count + 1)
        var graph = [Int: [Int]]()
        for e in edges {
            if var arr = graph[e[0]] {
                arr.append(e[1])
                graph[e[0]] = arr
            } else {
                graph[e[0]] = [e[1]]
            }
            if var arr = graph[e[1]] {
                arr.append(e[0])
                graph[e[1]] = arr
            } else {
                graph[e[1]] = [e[0]]
            }
        }
        var result = 0
        dfs(graph, &visited, 0, &result)
        return result
    }

    func dfs(_ graph: [Int: [Int]], _ visited: inout [Bool], _ node: Int, _ diameter: inout Int) -> Int {
        visited[node] = true
        var lMaxDepth = 0
        for n in graph[node]! {
            if !visited[n] {
                let d = dfs(graph, &visited, n, &diameter)
                diameter = max(diameter, d + lMaxDepth)
                lMaxDepth = max(d, lMaxDepth)
            }
        }
        return node == 0 ? diameter : lMaxDepth + 1
        }
}