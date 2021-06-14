/*
1004. Max Consecutive Ones III
Given an array A of 0s and 1s, we may change up to K values from 0 to 1.

Return the length of the longest (contiguous) subarray that contains only 1s. 

 

Example 1:

Input: A = [1,1,1,0,0,0,1,1,1,1,0], K = 2
Output: 6
Explanation: 
[1,1,1,0,0,1,1,1,1,1,1]
Bolded numbers were flipped from 0 to 1.  The longest subarray is underlined.

Example 2:

Input: A = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], K = 3
Output: 10
Explanation: 
[0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
Bolded numbers were flipped from 0 to 1.  The longest subarray is underlined.

 

Note:

    1 <= A.length <= 20000
    0 <= K <= A.length
    A[i] is 0 or 1 

https://leetcode.com/problems/max-consecutive-ones-iii/
*/
class Solution {
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        var result = Int.min
        var left = 0
        var zeroCount = 0
        for right in A.indices {
            if A[right] == 0 {
                zeroCount += 1
                while zeroCount > K {
                    if A[left] == 0 {
                        zeroCount -= 1
                    }
                    left += 1
                }
            }
            result = max(result, right - left + 1)
        }
        return result == Int.min ? 0 : result
    }
}