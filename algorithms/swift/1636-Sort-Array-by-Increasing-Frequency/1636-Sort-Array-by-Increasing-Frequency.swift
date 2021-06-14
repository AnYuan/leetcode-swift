/*
 1636. Sort Array by Increasing Frequency



Given an array of integers nums, sort the array in increasing order based on the frequency of the values. If multiple values have the same frequency, sort them in decreasing order.

Return the sorted array.

 

Example 1:

Input: nums = [1,1,2,2,2,3]
Output: [3,1,1,2,2,2]
Explanation: '3' has a frequency of 1, '1' has a frequency of 2, and '2' has a frequency of 3.

Example 2:

Input: nums = [2,3,1,3,2]
Output: [1,3,3,2,2]
Explanation: '2' and '3' both have a frequency of 2, so they are sorted in decreasing order.

Example 3:

Input: nums = [-1,1,-6,4,5,-6,1,4,1]
Output: [5,-1,4,4,-6,-6,1,1,1]

 

Constraints:

    1 <= nums.length <= 100
    -100 <= nums[i] <= 100

https://leetcode.com/contest/biweekly-contest-38/problems/sort-array-by-increasing-frequency/
*/
class Solution {
    func frequencySort(_ nums: [Int]) -> [Int] {
        var dict = [Int: Int]() // num : count 
        for n in nums {
            dict[n, default: 0] += 1
        }
        var freq = [Int: [Int]]()
        for (k, v) in dict {
            freq[v, default: [Int]()].append(k)
        }
        for (k,v) in freq {
            freq[k] = v.sorted(by: >)
        }
        var result = [Int]()
        for i in 1..<101 {
            if let values = freq[i] {
                for v in values {
                    result.append(contentsOf: [Int](repeating: v, count: i))
                }
            }
        }
        return result
    }
}