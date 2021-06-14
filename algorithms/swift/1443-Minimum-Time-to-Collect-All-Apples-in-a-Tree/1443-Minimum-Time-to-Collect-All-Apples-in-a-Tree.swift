/*
1443. Minimum Time to Collect All Apples in a Tree

Given an undirected tree consisting of n vertices numbered from 0 to n-1, which has some apples in their vertices. You spend 1 second to walk over one edge of the tree. Return the minimum time in seconds you have to spend in order to collect all apples in the tree starting at vertex 0 and coming back to this vertex.

The edges of the undirected tree are given in the array edges, where edges[i] = [fromi, toi] means that exists an edge connecting the vertices fromi and toi. Additionally, there is a boolean array hasApple, where hasApple[i] = true means that vertex i has an apple, otherwise, it does not have any apple.

 

Example 1:

Input: n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], hasApple = [false,false,true,false,true,true,false]
Output: 8 
Explanation: The figure above represents the given tree where red vertices have an apple. One optimal path to collect all apples is shown by the green arrows.  

Example 2:

Input: n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], hasApple = [false,false,true,false,false,true,false]
Output: 6
Explanation: The figure above represents the given tree where red vertices have an apple. One optimal path to collect all apples is shown by the green arrows.  

Example 3:

Input: n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], hasApple = [false,false,false,false,false,false,false]
Output: 0

 

Constraints:

    1 <= n <= 10^5
    edges.length == n-1
    edges[i].length == 2
    0 <= fromi, toi <= n-1
    fromi < toi
    hasApple.length == n

https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/
*/
class Solution {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        // init graph
        var graph = [Int: [Int]]()
        for e in edges {
            let n0 = e[0]
            let n1 = e[1]
            graph[n0, default: [Int]()].append(n1)
            graph[n1, default: [Int]()].append(n0)
        }
        // go and back, so, double the result
        return dfs(graph, 0, 0, hasApple, Set<Int>()) * 2
    }
    func dfs(_ graph: [Int: [Int]], _ node: Int, _ d: Int, _ hasApple: [Bool], _ visited: Set<Int>) -> Int {
        var result = 0
        var visited = visited
        guard let adj  = graph[node] else { return 0 }
        for i in adj where !visited.contains(i) {
            var temp = 0
            visited.insert(node)
            // distance is 1 means from parent to child node's distance
            temp = dfs(graph, i, 1, hasApple, visited)
            if temp > 0 {
                // distance in child node
                result += temp
            }
        }
        return (result > 0 || hasApple[node]) ? result + d : 0
    }
}