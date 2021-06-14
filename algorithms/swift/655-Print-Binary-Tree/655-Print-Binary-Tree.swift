/*
655. Print Binary Tree

Print a binary tree in an m*n 2D string array following these rules:

    The row number m should be equal to the height of the given binary tree.
    The column number n should always be an odd number.
    The root node's value (in string format) should be put in the exactly middle of the first row it can be put. The column and the row where the root node belongs will separate the rest space into two parts (left-bottom part and right-bottom part). You should print the left subtree in the left-bottom part and print the right subtree in the right-bottom part. The left-bottom part and the right-bottom part should have the same size. Even if one subtree is none while the other is not, you don't need to print anything for the none subtree but still need to leave the space as large as that for the other subtree. However, if two subtrees are none, then you don't need to leave space for both of them.
    Each unused space should contain an empty string "".
    Print the subtrees following the same rules.

Example 1:

Input:
     1
    /
   2
Output:
[["", "1", ""],
 ["2", "", ""]]

Example 2:

Input:
     1
    / \
   2   3
    \
     4
Output:
[["", "", "", "1", "", "", ""],
 ["", "2", "", "", "", "3", ""],
 ["", "", "4", "", "", "", ""]]

Example 3:

Input:
      1
     / \
    2   5
   / 
  3 
 / 
4 
Output:

[["",  "",  "", "",  "", "", "", "1", "",  "",  "",  "",  "", "", ""]
 ["",  "",  "", "2", "", "", "", "",  "",  "",  "",  "5", "", "", ""]
 ["",  "3", "", "",  "", "", "", "",  "",  "",  "",  "",  "", "", ""]
 ["4", "",  "", "",  "", "", "", "",  "",  "",  "",  "",  "", "", ""]]

https://leetcode.com/problems/print-binary-tree/
https://leetcode.com/problems/print-binary-tree/discuss/106273/Simple-Python-with-thorough-explanation
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
    func printTree(_ root: TreeNode?) -> [[String]] {
        let row = height(root)
        let col = (Int)(pow(Double(2), Double(row))) - 1
        var result = [[String]](repeating: [String](repeating: "", count: col), count: row)
        helper(root, 0, 0, &result, row)
        return result
    }
    
    private func height(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }     
        return 1 + max(height(node.left), height(node.right))
    }
    
    private func helper(_ node: TreeNode?, _ level: Int, _ position: Int, _ matrix: inout [[String]], _ row: Int) {
        guard let node = node else { return }    
        let leftPadding = (Int)(pow(Double(2), Double(row-level-1))) - 1
        let spacing = (Int)(pow(Double(2), Double(row-level))) - 1
        let index = leftPadding + position * (spacing + 1)
        matrix[level][index] = "\(node.val)"
        helper(node.left, level+1, position << 1, &matrix,row)
        helper(node.right, level+1, (position << 1)+1, &matrix, row)
    }
}