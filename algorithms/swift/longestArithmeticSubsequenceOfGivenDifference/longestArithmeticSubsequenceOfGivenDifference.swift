/*
1218. Longest Arithmetic Subsequence of Given Difference

Given an integer array arr and an integer difference, return the length of the longest subsequence in arr which is an arithmetic sequence such that the difference between adjacent elements in the subsequence equals difference.

 

Example 1:

Input: arr = [1,2,3,4], difference = 1
Output: 4
Explanation: The longest arithmetic subsequence is [1,2,3,4].
Example 2:

Input: arr = [1,3,5,7], difference = 1
Output: 1
Explanation: The longest arithmetic subsequence is any single element.
Example 3:

Input: arr = [1,5,7,8,5,3,4,2,1], difference = -2
Output: 4
Explanation: The longest arithmetic subsequence is [7,5,3,1].
 

Constraints:

1 <= arr.length <= 10^5
-10^4 <= arr[i], difference <= 10^4

https://leetcode.com/problems/longest-arithmetic-subsequence-of-given-difference/
*/
class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {

            var dp = [Int](repeating: 0, count: arr.count)
            dp[dp.count - 1] = 1

            var dict = [Int: Int]()
            dict[arr[arr.count - 1]] = 1

            var result = 1

            for i in (0..<dp.count-1).reversed() {
                var oldValue = dict[arr[i] + difference] ?? 0
                dp[i] = 1 + oldValue
                dict[arr[i]] = dp[i]
                result = max(result, dp[i])
            }

            return result
        }
}