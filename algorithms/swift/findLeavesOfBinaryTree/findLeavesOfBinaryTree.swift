/*
366. Find Leaves of Binary Tree

Given a binary tree, collect a tree's nodes as if you were doing this: Collect and remove all leaves, repeat until the tree is empty.

 

Example:

Input: [1,2,3,4,5]
  
          1
         / \
        2   3
       / \     
      4   5    

Output: [[4,5,3],[2],[1]]
 

Explanation:

1. Removing the leaves [4,5,3] would result in this tree:

          1
         / 
        2          
 

2. Now removing the leaf [2] would result in this tree:

          1          
 

3. Now removing the leaf [1] would result in the empty tree:

          []         


https://leetcode.com/problems/find-leaves-of-binary-tree/
*/
class Solution {
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        func searchHeight(_ node: TreeNode?) -> Int {
            guard let node = node else { return -1 }
            let l = searchHeight(node.left)
            let r = searchHeight(node.right)
            let level = max(l, r) + 1
            if result.count <= level {
                result.append([])
            }
            
            result[level].append(node.val)
            node.left = nil
            node.right = nil
            return level
        }
        searchHeight(root)
        return result
        
    }
}