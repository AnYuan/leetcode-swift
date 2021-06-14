/*
1197. Minimum Knight Moves

In an infinite chess board with coordinates from -infinity to +infinity, you have a knight at square [0, 0].

A knight has 8 possible moves it can make, as illustrated below. Each move is two squares in a cardinal direction, then one square in an orthogonal direction.

Return the minimum number of steps needed to move the knight to the square [x, y].  It is guaranteed the answer exists.

 

Example 1:

Input: x = 2, y = 1
Output: 1
Explanation: [0, 0] → [2, 1]

Example 2:

Input: x = 5, y = 5
Output: 4
Explanation: [0, 0] → [2, 1] → [4, 2] → [3, 4] → [5, 5]

 

Constraints:

    |x| + |y| <= 300

https://leetcode.com/problems/minimum-knight-moves/
*/
class Solution {

    struct Location: Hashable {
        let x: Int
        let y: Int
    }
    
    func minKnightMoves(_ x: Int, _ y: Int) -> Int {
        if x == 0, y == 0 { return 0 }
        /*
        {{1,2},{2,1},{2,-1},{1,-2},{-1,2},{-2,1},{-1,-2},{-2,-1}}
        */
        let dxy = [Location(x: 1, y: 2), Location(x: 2, y: 1), 
                   Location(x: 2, y: -1), Location(x: 1, y: -2), 
                   Location(x: -1, y: 2), Location(x: -2, y: 1), 
                   Location(x: -1, y: -2), Location(x: -2, y: -1)]
        var queue = [Location(x: 0, y: 0)]
        var visited = Set<Location>()
        var result = 0
        while !queue.isEmpty {
            
            result += 1
            
            let count = queue.count 
            for i in 0..<count {
                let current = queue.removeFirst()
                visited.insert(current)
                for d in dxy {
                                        
                    let next = Location(x: current.x + d.x, y: current.y + d.y)

                    if next.x == x, next.y == y {
                        return result
                    }
                    // not visited, same direction
                    if !visited.contains(next), next.x * x >= -2, next.y * y >= -2 {
                        queue.append(next)
                        visited.insert(next)
                    }
                }    
            }
        }
        return -1
    }
}