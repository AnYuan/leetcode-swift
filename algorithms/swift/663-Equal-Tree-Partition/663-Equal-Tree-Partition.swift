/*
663. Equal Tree Partition

 Given a binary tree with n nodes, your task is to check if it's possible to partition the tree to two trees which have the equal sum of values after removing exactly one edge on the original tree.

Example 1:

Input:     
    5
   / \
  10 10
    /  \
   2   3

Output: True
Explanation: 
    5
   / 
  10
      
Sum: 15

   10
  /  \
 2    3

Sum: 15

Example 2:

Input:     
    1
   / \
  2  10
    /  \
   2   20

Output: False
Explanation: You can't split the tree into two trees with equal sum after removing exactly one edge on the tree.

Note:

    The range of tree node value is in the range of [-100000, 100000].
    1 <= n <= 10000

https://leetcode.com/problems/equal-tree-partition/
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var dict = [Int: [TreeNode]]()
    func checkEqualTree(_ root: TreeNode?) -> Bool {
        let sum = dfs(root)
        // [0,-1,1]
        if sum == 0 {
            for ns in dict.values {
                for n in ns {
                    if n.val == 0, n !== root {
                        return true
                    }                    
                }
            }
        } else {
            return sum % 2 == 0 && dict.keys.contains(sum/2)
        }
        return  false
    }
    
    func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }   
        node.val = dfs(node.left) + dfs(node.right) + node.val
        dict[node.val, default: [TreeNode]()].append(node)
        return node.val
    }
}