/*
 78. Subsets

 Given a set of distinct integers, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.

 Example:

 Input: nums = [1,2,3]
 Output:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]

 https://leetcode.com/problems/subsets/


 explanation:

 i: 0
 before set: []
 after set: [1]
 before res: [[]]
 before res: [[], [1]]

 i: 1
 before set: []
 after set: [2]
 before res: [[], [1]]
 before res: [[], [1], [2]]

 before set: [1]
 after set: [1, 2]
 before res: [[], [1], [2]]
 before res: [[], [1], [2], [1, 2]]

 i: 2
 before set: []
 after set: [3]
 before res: [[], [1], [2], [1, 2]]
 before res: [[], [1], [2], [1, 2], [3]]

 before set: [1]
 after set: [1, 3]
 before res: [[], [1], [2], [1, 2], [3]]
 before res: [[], [1], [2], [1, 2], [3], [1, 3]]

 before set: [2]
 after set: [2, 3]
 before res: [[], [1], [2], [1, 2], [3], [1, 3]]
 before res: [[], [1], [2], [1, 2], [3], [1, 3], [2, 3]]

 before set: [1, 2]
 after set: [1, 2, 3]
 before res: [[], [1], [2], [1, 2], [3], [1, 3], [2, 3]]
 before res: [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


 */

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {

        var res = [[Int]]()

        res.append([Int]()) //insert empty array first

        for i in nums.indices {
            for var set in res {
                set.append(nums[i])
                res.append(set)
            }
        }
        return res
    }
}
