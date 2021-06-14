/*
1658. Minimum Operations to Reduce X to Zero

You are given an integer array nums and an integer x. In one operation, you can either remove the leftmost or the rightmost element from the array nums and subtract its value from x. Note that this modifies the array for future operations.

Return the minimum number of operations to reduce x to exactly 0 if it's possible, otherwise, return -1.

 

Example 1:

Input: nums = [1,1,4,2,3], x = 5
Output: 2
Explanation: The optimal solution is to remove the last two elements to reduce x to zero.

Example 2:

Input: nums = [5,6,7,8,9], x = 4
Output: -1

Example 3:

Input: nums = [3,2,20,1,1,3], x = 10
Output: 5
Explanation: The optimal solution is to remove the last three elements and the first two elements (5 operations in total) to reduce x to zero.

 

Constraints:

    1 <= nums.length <= 105
    1 <= nums[i] <= 104
    1 <= x <= 109

https://leetcode.com/contest/weekly-contest-215/problems/minimum-operations-to-reduce-x-to-zero/
*/
class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {

        let n = nums.count
        guard n > 0 else { return -1 }
        let sum = nums.reduce(0, +)
        guard sum >= x else { return -1 }
        
        var result = Int.max
        var preSum = [Int](repeating: 0, count: n)
        var postSum = [Int](repeating: 0, count: n)
        preSum[0] = nums[0]
        postSum[n-1] = nums[n-1]
        if preSum[0] == x || postSum[n-1] == x {
            return 1
        }
        for i in 1..<n {
            preSum[i] = preSum[i-1] + nums[i]
        }
        for i in (0..<(n-1)).reversed() {
            postSum[i] = postSum[i+1] + nums[i]
        }
        

        for i in (0..<n).reversed() {
            let n1 = postSum[i]
            if n1 < x {
                let index = find(preSum, x-n1)
                if index != -1 {
                    result = min(index+1+n-i, result)
                }
            } else if n1 == x {
                result = min(n-i, result)
            }
        }
        return result == Int.max ? -1 : result
    }
    
    func find(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count-1
        while lo <= hi {
            var mid = lo + (hi-lo) / 2
            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        return -1
    }
}