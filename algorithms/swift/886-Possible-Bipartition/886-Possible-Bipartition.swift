/*
886. Possible Bipartition

Given a set of N people (numbered 1, 2, ..., N), we would like to split everyone into two groups of any size.

Each person may dislike some other people, and they should not go into the same group. 

Formally, if dislikes[i] = [a, b], it means it is not allowed to put the people numbered a and b into the same group.

Return true if and only if it is possible to split everyone into two groups in this way.

 

Example 1:

Input: N = 4, dislikes = [[1,2],[1,3],[2,4]]
Output: true
Explanation: group1 [1,4], group2 [2,3]

Example 2:

Input: N = 3, dislikes = [[1,2],[1,3],[2,3]]
Output: false

Example 3:

Input: N = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[1,5]]
Output: false

 

Note:

    1 <= N <= 2000
    0 <= dislikes.length <= 10000
    1 <= dislikes[i][j] <= N
    dislikes[i][0] < dislikes[i][1]
    There does not exist i != j for which dislikes[i] == dislikes[j].

https://leetcode.com/problems/possible-bipartition/
*/
class Solution {
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        
        guard !dislikes.isEmpty else { return true }
        
        var graph = [Int: [Int]]()

        for d in dislikes {
            graph[d[0], default: [Int]()].append(d[1])
            graph[d[1], default: [Int]()].append(d[0])
        }
        var group = [Int](repeating: 0, count: N+1) // 0: not visit, 1: group one, -1: group two
        
        for i in 1...N where group[i] == 0 {
            if !bfs(graph, &group, i) {
                return false
            }
        }
        return true
    }
    
    func bfs(_ graph: [Int: [Int]], _ group: inout [Int], _ current: Int) -> Bool {
        var queue = [current]
        group[current] = 1
        
        while !queue.isEmpty {
            let n = queue.removeFirst()
            for d in graph[n, default: [Int]()] {
                if group[d] == 0 {
                    group[d] = -1 * group[n]
                    queue.append(d)
                } else {
                    if group[d] == group[n] {
                        return false
                    }
                }
            }
        }
        return true
    }
}