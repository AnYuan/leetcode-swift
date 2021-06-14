/*
 95. Unique Binary Search Trees II

 Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1 ... n.

 Example:

 Input: 3
 Output:
 [
 [1,null,3,2],
 [3,2,null,1],
 [3,1,null,null,2],
 [2,1,3],
 [1,null,2,null,3]
 ]
 Explanation:
 The above output corresponds to the 5 unique BST's shown below:

   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3

https://leetcode.com/problems/unique-binary-search-trees-ii/
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n > 0 else { return [] }
        return helper(1, n)
    }

    private func helper(_ start: Int, _ end: Int) -> [TreeNode?] {
        guard start <= end else { return [nil] }
        if start == end {
            return [TreeNode(start)]
        } else {
            var result = [TreeNode?]()
            for root in start...end {
                for left in helper(start, root-1) {
                    for right in helper(root+1, end) {
                        let r = TreeNode(root)
                        r.left = left
                        r.right = right
                        result.append(r)
                    }
                }
            }
            return result
        }
    }
}
