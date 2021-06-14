/*
536. Construct Binary Tree from String

You need to construct a binary tree from a string consisting of parenthesis and integers.

The whole input represents a binary tree. It contains an integer followed by zero, one or two pairs of parenthesis. The integer represents the root's value and a pair of parenthesis contains a child binary tree with the same structure.

You always start to construct the left child node of the parent first if it exists.

Example:

Input: "4(2(3)(1))(6(5))"
Output: return the tree root node representing the following tree:

       4
     /   \
    2     6
   / \   / 
  3   1 5   

Note:

    There will only be '(', ')', '-' and '0' ~ '9' in the input string.
    An empty tree is represented by "" instead of "()".

https://leetcode.com/problems/construct-binary-tree-from-string/
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
    func str2tree(_ s: String) -> TreeNode? {
        guard !s.isEmpty else { return nil }
        return helper([Character](s))
    }
    
    func helper(_ cs: [Character]) -> TreeNode? {
        guard !cs.isEmpty else { return nil }
        var cs = cs
        // if there is a left parenthesis index
        guard let li = cs.firstIndex(of: "(") else { 
            // else return root node
            return TreeNode(Int(String(cs))!)
        }
        // find subtree right parenthesis index
        var counter = 0
        var ri = li
        for i in li..<cs.count {
            let c = cs[i]
            if c == "(" {
                counter += 1
            }
            if c == ")" {
                counter -= 1
            }
            if i > li, counter == 0 {
                ri = i
                break
            }
        }
        
        let root = TreeNode(Int(String(cs[0..<li]))!)
        root.left = helper(Array(cs[(li+1)..<ri]))
        // if there is right subtree
        if ri + 2 < cs.count {
            root.right = helper(Array(cs[(ri+2)..<(cs.count-1)]))
        }
        return root
    }
}