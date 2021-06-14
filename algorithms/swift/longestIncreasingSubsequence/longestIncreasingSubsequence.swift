/*
 Given an unsorted array of integers, find the length of longest increasing subsequence.

 Example:

 Input: [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.

 Note:
 * There may be more than one LIS combination, it is only necessary for you to return the length.
 * Your algorithm should run in O(n2) complexity.

 Follow up: Could you improve it to O(n log n) time complexity?


 https://leetcode.com/problems/longest-increasing-subsequence/
 */
func lengthOfLIS(_ nums: [Int]) -> Int {

    guard nums.count > 1 else { return nums.count }

    var dp = [[Int]]()
    dp.append([nums[0]])
    var longest = 1

    for i in 1..<nums.count {
        var maxCount = 0
        var maxIndex = 0
        for j in 0..<i {
            if nums[i] > nums[j] {
                if dp[j].count > maxCount {
                    maxCount = dp[j].count
                    maxIndex = j
                }
            }
        }
        // smallest so far, just append
        if maxCount == 0 {
            dp.append([nums[i]])
        } else {
            var list = dp[maxIndex]
            list.append(nums[i])
            if list.count > longest { longest = list.count }
            dp.append(list)
        }
    }

    return longest
}
