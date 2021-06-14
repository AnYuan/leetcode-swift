/*
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.


 e.g 1

 Input: [3,2,3]
 Output: 3

 e.g 2

 Input: [2,2,1,1,1,2,2]
 Output: 2

 https://leetcode.com/problems/majority-element/

 */

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict = [Int: Int]() // num : count
        let count = nums.count
        for n in nums {
            dict[n, default: 0] += 1
            if let c = dict[n], c > count/2 {
                return n
            }
        }
        return 0 // should not reach here
    }
}
