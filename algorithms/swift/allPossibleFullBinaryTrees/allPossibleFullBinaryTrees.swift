/*
 894. All Possible Full Binary Trees

 A full binary tree is a binary tree where each node has exactly 0 or 2 children.

 Return a list of all possible full binary trees with N nodes.  Each element of the answer is the root node of one possible tree.

 Each node of each tree in the answer must have node.val = 0.

 You may return the final list of trees in any order.

 

 Example 1:

 Input: 7
 Output: [[0,0,0,null,null,0,0,null,null,0,0],[0,0,0,null,null,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,null,null,null,null,0,0],[0,0,0,0,0,null,null,0,0]]
 Explanation:

 Note:

 1 <= N <= 20


 https://leetcode.com/problems/all-possible-full-binary-trees/
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

    var cache = [Int: [TreeNode?]]()

    func allPossibleFBT(_ N: Int) -> [TreeNode?] {
        if N % 2 == 0 { return [] }
        if let result = cache[N] {
            return result
        }
        var result = [TreeNode?]()

        if N == 1 {
            result.append(TreeNode(0))
        } else {
            for i in stride(from: 1, to: N, by: 2) {
                var leftNodes = allPossibleFBT(i)
                var rightNodes = allPossibleFBT(N-i-1)

                for left in leftNodes {
                    for right in rightNodes {
                        let node = TreeNode(0)
                        node.left = left
                        node.right = right
                        result.append(node)
                    }
                }
            }
        }
        cache[N] = result
        return result
    }
}
