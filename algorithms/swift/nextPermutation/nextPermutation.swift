/*
 31. Next Permutation

 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

 The replacement must be in-place and use only constant extra memory.

 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.

 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1

 https://leetcode.com/problems/next-permutation/
 */

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var n = nums.count
        var k = -1
        var l = -1
        for i in (0 ..< n - 1).reversed() {
            if nums[i] < nums[i + 1] {
                k = i
                break
            }
        }
        if k == -1 {
            nums = nums.reversed()
        } else {
            for j in (0 ..< n).reversed() {
                if nums[j] > nums[k] {
                    l = j
                    break
                }
            }
            nums.swapAt(k, l)
            nums = nums[0...k] + nums[k + 1...nums.count - 1].reversed()
        }
    }
}
