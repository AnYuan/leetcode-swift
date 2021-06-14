/*
825. Friends Of Appropriate Ages

Some people will make friend requests. The list of their ages is given and ages[i] is the age of the ith person. 

Person A will NOT friend request person B (B != A) if any of the following conditions are true:

    age[B] <= 0.5 * age[A] + 7
    age[B] > age[A]
    age[B] > 100 && age[A] < 100

Otherwise, A will friend request B.

Note that if A requests B, B does not necessarily request A.  Also, people will not friend request themselves.

How many total friend requests are made?

Example 1:

Input: [16,16]
Output: 2
Explanation: 2 people friend request each other.

Example 2:

Input: [16,17,18]
Output: 2
Explanation: Friend requests are made 17 -> 16, 18 -> 17.

Example 3:

Input: [20,30,100,110,120]
Output: 
Explanation: Friend requests are made 110 -> 100, 120 -> 110, 120 -> 100.

 

Notes:

    1 <= ages.length <= 20000.
    1 <= ages[i] <= 120.

https://leetcode.com/problems/friends-of-appropriate-ages/
*/
class Solution {
    func numFriendRequests(_ ages: [Int]) -> Int {
        
        var count = [Int](repeating: 0, count: 121)
        for a in ages {
            count[a] += 1
        }
        var result = 0
        
        for a in 0..<121 {
            for b in 0..<121 {
                if Double(b) <= (0.5 * Double(a) + 7) || b > a || ((b > 100) && (a < 100)) {
                    continue
                } else {
                    let countA = count[a]
                    let countB = count[b]
                    // A and B will send request to each other
                    result += countA * countB
                    if a == b {
                        // only A will request to B
                        result -= countB
                    }
                }
            }
        }
        return result
    }
}