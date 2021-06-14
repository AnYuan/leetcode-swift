/*
 199. Binary Tree Right Side View

 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

 Example:

 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 Explanation:

     1            <---
   /   \
  2     3         <---
   \     \
    5     4       <---


https://leetcode.com/problems/binary-tree-right-side-view/
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        guard let root = root else { return [] }

        var result = [Int]()
        var queue = [root]
        
        while !queue.isEmpty {
            let levelSize = queue.count
            for i in 0..<levelSize {
                let node = queue.removeFirst()
                if i == levelSize - 1 {
                    result.append(node.val)
                }
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return result
    }
}
