/*
923. 3Sum With Multiplicity

Example 1:

Input: A = [1,1,2,2,3,3,4,4,5,5], target = 8
Output: 20
Explanation: 
Enumerating by the values (A[i], A[j], A[k]):
(1, 2, 5) occurs 8 times;
(1, 3, 4) occurs 8 times;
(2, 2, 4) occurs 2 times;
(2, 3, 3) occurs 2 times.

Example 2:

Input: A = [1,1,2,2,2,2], target = 5
Output: 12
Explanation: 
A[i] = 1, A[j] = A[k] = 2 occurs 12 times:
We choose one 1 from [1,1] in 2 ways,
and two 2s from [2,2,2,2] in 6 ways.

 

Constraints:

    3 <= A.length <= 3000
    0 <= A[i] <= 100
    0 <= target <= 300

https://leetcode.com/problems/3sum-with-multiplicity/
*/
class Solution {
    func threeSumMulti(_ A: [Int], _ target: Int) -> Int {
        let A = A.sorted()
        var result = 0
        let mod = 1000000000 + 7
        for i in 0..<A.count-1 {
            var left = i + 1
            var right = A.count - 1
            var t = target - A[i]
            while left < right {
                let val = A[left] + A[right]
                if val < t {
                    left += 1
                } else if val > t{
                    right -= 1
                } else if A[left] != A[right] {
                    var ln = 1 // same number of left 
                    var rn = 1  // same number of right
                    while left + 1 < right, A[left] == A[left + 1] {
                        ln += 1
                        left += 1
                    }
                    while right - 1 > left, A[right] == A[right - 1] {
                        rn += 1
                        right -= 1
                    }
                    result += ln * rn
                    result %= mod
                    left += 1
                    right -= 1                    
                } else {
                    // Cn2 = n * (n-1) / 2
                    result += (right-left+1) * (right-left) / 2
                    result %= mod
                    break
                }
            }
        }
        return result % mod
    }
}