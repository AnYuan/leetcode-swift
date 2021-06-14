/*
1457. Pseudo-Palindromic Paths in a Binary Tree

Given a binary tree where node values are digits from 1 to 9. A path in the binary tree is said to be pseudo-palindromic if at least one permutation of the node values in the path is a palindrome.

Return the number of pseudo-palindromic paths going from the root node to leaf nodes.

 

Example 1:

Input: root = [2,3,1,3,1,null,1]
Output: 2 
Explanation: The figure above represents the given binary tree. There are three paths going from the root node to leaf nodes: the red path [2,3,3], the green path [2,1,1], and the path [2,3,1]. Among these paths only red path and green path are pseudo-palindromic paths since the red path [2,3,3] can be rearranged in [3,2,3] (palindrome) and the green path [2,1,1] can be rearranged in [1,2,1] (palindrome).

Example 2:

Input: root = [2,1,1,1,3,null,null,null,null,null,1]
Output: 1 
Explanation: The figure above represents the given binary tree. There are three paths going from the root node to leaf nodes: the green path [2,1,1], the path [2,1,3,1], and the path [2,1]. Among these paths only the green path is pseudo-palindromic since [2,1,1] can be rearranged in [1,2,1] (palindrome).

Example 3:

Input: root = [9]
Output: 1

 

Constraints:

    The given binary tree will have between 1 and 10^5 nodes.
    Node values are digits from 1 to 9.

https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/
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
    
    var result = 0
    
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        dfs(root, [Int](repeating: 0, count: 10))
        return result
    }
    
    func dfs(_ node: TreeNode?, _ countArray: [Int]) {
        guard let node = node else { return }
        
        var countArray = countArray

        countArray[node.val] += 1

        // leaf node
        if node.left == nil, node.right == nil { 
            var odd = 0
            for c in countArray where c % 2 == 1 {
                odd += 1
            }
            // palindrom
            if odd <= 1 { result += 1 }
            return 
        }

        dfs(node.left, countArray)
        dfs(node.right, countArray)
    }
}