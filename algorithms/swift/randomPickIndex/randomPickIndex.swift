/*
398. Random Pick Index

Given an array of integers with possible duplicates, randomly output the index of a given target number. You can assume that the given target number must exist in the array.

Note:
The array size can be very large. Solution that uses too much extra space will not pass the judge.

Example:

int[] nums = new int[] {1,2,3,3,3};
Solution solution = new Solution(nums);

// pick(3) should return either index 2, 3, or 4 randomly. Each index should have equal probability of returning.
solution.pick(3);

// pick(1) should return 0. Since in the array only nums[0] is equal to 1.
solution.pick(1);

https://leetcode.com/problems/random-pick-index/
*/
class Solution {
    private(set) var dict = [Int: [Int]]() // value: [indexes]
    init(_ nums: [Int]) {
        for i in 0..<nums.count {
            if var values = dict[nums[i]] {
                values.append(i)
                dict[nums[i]] = values
            } else {
                dict[nums[i]] = [i]
            }
        }
    }
    
    func pick(_ target: Int) -> Int {
        if let values = dict[target] {
            let index = Int.random(in: 0..<values.count)
            return values[index]
        } else {
            return -1
        }
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: Int = obj.pick(target)
 */