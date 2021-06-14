/*
930. Binary Subarrays With Sum

In an array A of 0s and 1s, how many non-empty subarrays have sum S?

 

Example 1:

Input: A = [1,0,1,0,1], S = 2
Output: 4
Explanation: 
The 4 subarrays are bolded below:
[1,0,1,0,1]
[1,0,1,0,1]
[1,0,1,0,1]
[1,0,1,0,1]

 

Note:

    A.length <= 30000
    0 <= S <= A.length
    A[i] is either 0 or 1.

https://leetcode.com/problems/binary-subarrays-with-sum/
*/
class Solution {
    func numSubarraysWithSum(_ A: [Int], _ S: Int) -> Int {
        var left = 0
        var right = 0
        var result = 0
        let n = A.count
        var sum = 0
        while right < n {
            sum += A[right]
            while left < right, sum > S {
                sum -= A[left]
                left += 1
            }
            if sum < S {
                right += 1
                continue
            }
            if sum == S {
                result += 1
            }
            var t = left
            while t < right, A[t] == 0 {
                result += 1
                t += 1
            }
            right += 1
        }
        return result
    }
}