/*
666. Path Sum IV
If the depth of a tree is smaller than 5, then this tree can be represented by a list of three-digits integers.

For each integer in this list:

    The hundreds digit represents the depth D of this node, 1 <= D <= 4.
    The tens digit represents the position P of this node in the level it belongs to, 1 <= P <= 8. The position is the same as that in a full binary tree.
    The units digit represents the value V of this node, 0 <= V <= 9.

Given a list of ascending three-digits integers representing a binary tree with the depth smaller than 5, you need to return the sum of all paths from the root towards the leaves.

It's guaranteed that the given list represents a valid connected binary tree.

Example 1:

Input: [113, 215, 221]
Output: 12
Explanation: 
The tree that the list represents is:
    3
   / \
  5   1

The path sum is (3 + 5) + (3 + 1) = 12.

 

Example 2:

Input: [113, 221]
Output: 4
Explanation: 
The tree that the list represents is: 
    3
     \
      1

The path sum is (3 + 1) = 4.

https://leetcode.com/problems/path-sum-iv/
*/
class Solution {
    var result = 0
    func pathSum(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return result }
        dfs(nums, 0, 0)    
        return result
    }
    
    func dfs(_ nums: [Int], _ pos: Int, _ sum: Int) {
        guard pos != nums.count else { return }
        let n = nums[pos]
        let level = n / 100
        let col = n % 100 / 10
        let val = n % 10
        var sum = sum
        sum += val
        var counter = 0
        for i in (pos+1)..<nums.count {
            let nLevel = nums[i] / 100
            let nCol = nums[i] % 100 / 10
            if nLevel > level + 1 { break }
                        
            // find child node
            if nLevel == level + 1 && (nCol == 2 * col || nCol == 2 * col - 1) {
                counter += 1
                dfs(nums, i, sum)
            }
        }
        // reach leaf node, sum result
        if counter == 0 {
            result += sum
        }
    }
}