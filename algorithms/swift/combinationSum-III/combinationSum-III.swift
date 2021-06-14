/*
 216. Combination Sum III

 Find all possible combinations of k numbers that add up to a number n, given that only numbers from 1 to 9 can be used and each combination should be a unique set of numbers.

 Note:

 All numbers will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: k = 3, n = 7
 Output: [[1,2,4]]
 Example 2:

 Input: k = 3, n = 9
 Output: [[1,2,6], [1,3,5], [2,3,4]]

 https://leetcode.com/problems/combination-sum-iii/
 */

class Solution {

    var result = [[Int]]()
    var current = [Int]()

    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var candidates = [1,2,3,4,5,6,7,8,9]
        backtrack(candidates,n,0,k)
        return result
    }

    func backtrack(_ candidates : [Int], _ target : Int, _ index : Int, _ k : Int) {
        guard target >= 0 else { return }

        if target == 0 && k == 0 {
            result.append(current)
            return
        }

        for i in index..<candidates.count {
            if target < (candidates[i] + 1) * (k-1) {
                break
            }

            current.append(candidates[i])
            backtrack(candidates,target-candidates[i],i+1,k-1)
            current.removeLast(1)
        }
    }
}
