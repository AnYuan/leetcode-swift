/*
 207. Course Schedule

 There are a total of n courses you have to take, labeled from 0 to n-1.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

 Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?

 Example 1:

 Input: 2, [[1,0]] 
 Output: true
 Explanation: There are a total of 2 courses to take. 
 To take course 1 you should have finished course 0. So it is possible.

 Example 2:

 Input: 2, [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take. 
 To take course 1 you should have finished course 0, and to take course 0 you should
 also have finished course 1. So it is impossible.

 Note:

 1.The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 2.You may assume that there are no duplicate edges in the input prerequisites.


 */

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var visited = [Int]()
        var graph = [[Int]](repeating: [Int](), count: numCourses)
        var inDegree = [Int](repeating: 0, count: numCourses)

        for course in prerequisites {
            let from = course[0]
            let to = course[1]
            // update in-degree
            inDegree[to] += 1
            // init graph
            var list = graph[from]
            list.append(to)
            graph[from] = list
        }

        // start points
        for n in 0..<numCourses where inDegree[n] == 0 {
            visited.append(n)
        }

        // bfs
        while !visited.isEmpty {
            let c = visited.removeFirst()
            for x in graph[c] {
                inDegree[x] -= 1
                if inDegree[x] == 0 {
                    visited.append(x)
                }
            }
        }

        for i in 0..<numCourses {
            if inDegree[i] > 0 {
                return false
            }
        }
        return true
    }
}
