/*
276. Paint Fence

There is a fence with n posts, each post can be painted with one of the k colors.

You have to paint all the posts such that no more than two adjacent fence posts have the same color.

Return the total number of ways you can paint the fence.

Note:
n and k are non-negative integers.

Example:

Input: n = 3, k = 2
Output: 6
Explanation: Take c1 as color 1, c2 as color 2. All possible ways are:

            post1  post2  post3      
 -----      -----  -----  -----       
   1         c1     c1     c2 
   2         c1     c2     c1 
   3         c1     c2     c2 
   4         c2     c1     c1  
   5         c2     c1     c2
   6         c2     c2     c1

https://leetcode.com/problems/paint-fence/
https://leetcode.com/problems/paint-fence/solution/
*/
// top down
class Solution {
    
    var memo = [Int]()
    
    func numWays(_ n: Int, _ k: Int) -> Int {
        guard n > 0 else { return 0 }
        memo = [Int](repeating: 0, count: n+1)    
        return helper(n, k)
    }
    
    func helper(_ n: Int, _ k: Int) -> Int {
        if n == 1 { return k }
        if n == 2 { return k * k }
        if memo[n-1] == 0 {
            memo[n-1] = helper(n-1, k)
        }
        if memo[n-2] == 0 {
            memo[n-2] = helper(n-2, k)
        }
        return (memo[n-1] + memo[n-2]) * (k-1)
    }
}