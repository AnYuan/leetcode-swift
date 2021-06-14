/*
 39. Combination Sum

 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

 The same repeated number may be chosen from candidates unlimited number of times.

 Note:

 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
 [7],
 [2,2,3]
 ]
 Example 2:

 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
 [2,2,2,2],
 [2,3,3],
 [3,5]
 ]

 https://leetcode.com/problems/combination-sum/
 */

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var candidate = [Int]()

        backtracking(&result, &candidate, candidates.sorted(), target, 0)

        return result
    }

    private func backtracking(_ result: inout [[Int]], _ candidate: inout [Int], _ candidates: [Int], _ remain: Int, _ start: Int) {

        guard remain >= 0 else { return }
        if remain == 0 {
            result.append(candidate)
        } else {
            for i in start..<candidates.count {
                candidate.append(candidates[i])
                backtracking(&result, &candidate, candidates, remain - candidates[i], i)
                candidate.removeLast()
            }
        }
}
