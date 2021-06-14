/*
 501. Find Mode in Binary Search Tree

 Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in the given BST.

 Assume a BST is defined as follows:

 * The left subtree of a node contains only nodes with keys less than or equal to the node's key.
 * The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
 * Both the left and right subtrees must also be binary search trees.

 For example:
 Given BST [1,null,2,2],

   1
    \
     2
    /
   2

 return [2].

 Note: If a tree has more than one mode, you can return them in any order.

 Follow up: Could you do that without using any extra space? (Assume that the implicit stack space incurred due to recursion does not count).

 https://leetcode.com/problems/find-mode-in-binary-search-tree/
 https://leetcode.com/problems/find-mode-in-binary-search-tree/discuss/382834/Swift-100-64ms-O(n)-without-using-Hash-map
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
    private func dfs(_ root: TreeNode?,
                     _ prev: inout TreeNode?,
                     _ result: inout [Int],
                     _ maxCount: inout Int,
                     _ count: inout Int) {
        guard let root = root else { return }

        dfs(root.left, &prev, &result, &maxCount, &count)

        if root.val == prev?.val || prev?.val == nil {
            count += 1
        } else {
            count = 1
        }

        if count > maxCount {
            result.removeAll()
            result.append(root.val)
            maxCount = count
        } else if count == maxCount {
            result.append(root.val)
        }
        prev = root

        dfs(root.right, &prev, &result, &maxCount, &count)
    }

    func findMode(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var maxCount = 0
        var count = 0
        var prev: TreeNode? = nil
        dfs(root, &prev, &result, &maxCount, &count)
        return result
    }
}

