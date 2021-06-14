/*
 229. Majority Element II
 Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

 Note: The algorithm should run in linear time and in O(1) space.

 Example 1:

 Input: [3,2,3]
 Output: [3]
 Example 2:

 Input: [1,1,1,3,3,2,2,2]
 Output: [1,2]

 https://leetcode.com/problems/majority-element-ii/
 */

// https://gregable.com/2013/10/majority-vote-algorithm-find-majority.html
class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        // because of definition of majority, we can only have two majority num at most.
        var count1 = 0
        var count2 = 0
        var num1 = 0
        var num2 = 1

        for n in nums {
            if n == num1 {
                count1 += 1
            } else if n == num2 {
                count2 += 1
            } else if count1 == 0 {
                num1 = n
                count1 = 1
            } else if count2 == 0 {
                num2 = n
                count2 = 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }

        count1 = 0
        count2 = 0
        var result = [Int]()
        let majority = nums.count/3
        for num in nums {
            if num == num1 {
                count1 += 1
            } else if num == num2 {
                count2 += 1
            }
        }

        if count1 > majority {
            result.append(num1)
        }
        if count2 > majority {
            result.append(num2)
        }
        return result
    }
}
