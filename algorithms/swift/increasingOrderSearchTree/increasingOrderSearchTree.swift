/*
897. Increasing Order Search Tree

Given a binary search tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only 1 right child.

Example 1:
Input: [5,3,6,2,4,null,8,1,null,null,null,7,9]

       5
      / \
    3    6
   / \    \
  2   4    8
 /        / \ 
1        7   9

Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]

 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
            \
             7
              \
               8
                \
                 9  
Note:

1.The number of nodes in the given tree will be between 1 and 100.
2.Each node will have a unique integer value from 0 to 1000.

https://leetcode.com/problems/increasing-order-search-tree/
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
    var inorder = [TreeNode]()
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        helper(root)
        var result = TreeNode(0)
        var current:TreeNode? = result
        inorder.forEach { node in
            current?.right = TreeNode(node.val)
            current = current?.right
        }
        return result.right
    }
    
    private func helper(_ node: TreeNode?) {
        guard let node = node else { return }
        helper(node.left)
        inorder.append(node)
        helper(node.right)
    }
}