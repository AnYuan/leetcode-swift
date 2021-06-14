/*
 210. Course Schedule II

 There are a total of n courses you have to take, labeled from 0 to n-1.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

 Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.

 There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.

 Example 1:

 Input: 2, [[1,0]] 
 Output: [0,1]
 Explanation: There are a total of 2 courses to take. To take course 1 you should have finished   
 course 0. So the correct course order is [0,1] .

 Example 2:

 Input: 4, [[1,0],[2,0],[3,1],[3,2]]
 Output: [0,1,2,3] or [0,2,1,3]
 Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both     
 courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0. 
 So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3] .

 Note:

 1.The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.

 2.You may assume that there are no duplicate edges in the input prerequisites.

 */

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        guard !prerequisites.isEmpty else {
            return [Int](0..<numCourses)
        }
        var indegree = [Int: Int]() // course : pre count
        var graph = [Int: [Int]]() // pre: [courses]
        var topsort = [Int]()
        
        // init degree
        for i in 0..<numCourses {
            indegree[i] = 0
        }
        
        // setup graph and indegree
        for pair in prerequisites {
            let c = pair[0]
            let p = pair[1]
            indegree[c, default: 0] += 1
            if var cs = graph[p] {
                cs.append(c)
                graph[p] = cs
            } else {
                graph[p] = [c]
            }
        }
        
        var source = [Int]()
        for k in indegree.keys {
            if let value = indegree[k], value == 0 {
                source.append(k)
            }
        }
        
        while !source.isEmpty {
            let s = source.removeFirst()
            topsort.append(s)
            if let cs = graph[s], !cs.isEmpty {
                for c in cs {
                    if let d = indegree[c] {
                        indegree[c] = d - 1
                        if d - 1 == 0 {
                            source.append(c)
                        }
                    }
                }
            }
        }
        
        return topsort.count == numCourses ? topsort : []
    }
}