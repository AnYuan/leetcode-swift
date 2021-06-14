/*
845. Longest Mountain in Array

Let's call any (contiguous) subarray B (of A) a mountain if the following properties hold:

    B.length >= 3
    There exists some 0 < i < B.length - 1 such that B[0] < B[1] < ... B[i-1] < B[i] > B[i+1] > ... > B[B.length - 1]

(Note that B could be any subarray of A, including the entire array A.)

Given an array A of integers, return the length of the longest mountain. 

Return 0 if there is no mountain.

Example 1:

Input: [2,1,4,7,3,2,5]
Output: 5
Explanation: The largest mountain is [1,4,7,3,2] which has length 5.

Example 2:

Input: [2,2,2]
Output: 0
Explanation: There is no mountain.

Note:

    0 <= A.length <= 10000
    0 <= A[i] <= 10000

Follow up:

    Can you solve it using only one pass?
    Can you solve it in O(1) space?

https://leetcode.com/problems/longest-mountain-in-array/
*/
class Solution {
    func longestMountain(_ A: [Int]) -> Int {
        guard A.count >= 3 else { return 0 }
        var end = 0, result = 0, i = 0
        let n = A.count - 1
        while i < n {
            // skip noise
            while i < n, A[i] >= A[i+1] {
                i += 1
            }
            // subarray end index
            end = i+1
            // up
            while end < n, A[end] < A[end+1] {
                end += 1
            }
            // down
            while end < n, A[end] > A[end+1] {
                end += 1
                // update result
                result = max(result, end-i+1)
            }
            // update start index
            i = end
        }
        return result
    }
}