/*
40. Combination Sum II

Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

Each number in candidates may only be used once in the combination.

Note:

    All numbers (including target) will be positive integers.
    The solution set must not contain duplicate combinations.

Example 1:

Input: candidates = [10,1,2,7,6,1,5], target = 8,
A solution set is:
[
  [1, 7],
  [1, 2, 5],
  [2, 6],
  [1, 1, 6]
]

Example 2:

Input: candidates = [2,5,2,1,2], target = 5,
A solution set is:
[
  [1,2,2],
  [5]
]

https://leetcode.com/problems/combination-sum-ii/
*/
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        var result = [[Int]]()
        var current = [Int]()
        
        var candidates = candidates
        candidates.sort()
        
        dfs(&result, &current, candidates, 0, target)
        return result
    }
    
    func dfs(_ result: inout [[Int]], _ current: inout [Int], _ candidates: [Int], _ index: Int, _ target: Int) {
        if target < 0 { return }
        if target == 0 {
            result.append(current)
            return
        }
        for i in index..<candidates.count {
            if i != index && candidates[i - 1] == candidates[i] { continue }
            current.append(candidates[i])
            dfs(&result, &current, candidates, i + 1, target - candidates[i])       
            current.removeLast()
        }
    }
}
