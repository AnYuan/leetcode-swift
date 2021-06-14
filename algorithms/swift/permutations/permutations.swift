/*
 46. Permutations

 Given a collection of distinct integers, return all possible permutations.

 Example:

 Input: [1,2,3]
 Output:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]

 https://leetcode.com/problems/permutations/
 */
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        
        var result = [[Int]]()
        var permutations = [[Int]()]
        
        for num in nums {
            // we will take all existing permutations and add the current number to create new permutations
            let n = permutations.count
            for i in 0..<n {
                var oldPermutation = permutations.removeFirst()
                // create a new permutation by adding the current number at every position
                for j in 0...oldPermutation.count {
                    var permutation = oldPermutation
                    permutation.insert(num, at:j)
                    if permutation.count == nums.count {
                        result.append(permutation)
                    } else {
                        permutations.append(permutation)
                    }
                }
            }
        }
        return result
    }
}