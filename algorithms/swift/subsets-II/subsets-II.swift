/*
 90. Subsets II

 Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.

 Example:

 Input: [1,2,2]
 Output:
 [
 [2],
 [1],
 [1,2,2],
 [2,2],
 [1,2],
 []
 ]

 https://leetcode.com/problems/subsets-ii/
 */

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {

        let nums = nums.sorted()
        var result = [[Int]()]
        for i in 0..<nums.count {
            for j in 0..<result.count {
                var tmp = result[j]
                tmp.append(nums[i])
                result.append(tmp)
            }
        }
        return [[Int]](Set(result))
    }
}
