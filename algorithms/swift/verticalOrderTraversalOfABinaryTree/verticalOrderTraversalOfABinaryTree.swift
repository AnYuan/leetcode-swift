/*
987. Vertical Order Traversal of a Binary Tree

Given a binary tree, return the vertical order traversal of its nodes values.

For each node at position (X, Y), its left and right children respectively will be at positions (X-1, Y-1) and (X+1, Y-1).

Running a vertical line from X = -infinity to X = +infinity, whenever the vertical line touches some nodes, we report the values of the nodes in order from top to bottom (decreasing Y coordinates).

If two nodes have the same position, then the value of the node that is reported first is the value that is smaller.

Return an list of non-empty reports in order of X coordinate.  Every report will have a list of values of nodes.

 

Example 1:

Input: [3,9,20,null,null,15,7]
Output: [[9],[3,15],[20],[7]]
Explanation: 
Without loss of generality, we can assume the root node is at position (0, 0):
Then, the node with value 9 occurs at position (-1, -1);
The nodes with values 3 and 15 occur at positions (0, 0) and (0, -2);
The node with value 20 occurs at position (1, -1);
The node with value 7 occurs at position (2, -2).

Example 2:

Input: [1,2,3,4,5,6,7]
Output: [[4],[2],[1,5,6],[3],[7]]
Explanation: 
The node with value 5 and the node with value 6 have the same position according to the given scheme.
However, in the report "[1,5,6]", the node value of 5 comes first since 5 is smaller than 6.

 

Note:

    The tree will have between 1 and 1000 nodes.
    Each node's value will be between 0 and 1000.

https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/
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
    
    var locations = [(x: Int, y: Int, value: Int)]()
    
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        dfs(root, 0, 0)
        locations.sort { l0, l1 in
            if l0.x != l1.x {
                return l0.x < l1.x
            } else if l0.y != l1.y {
                return l0.y > l1.y
            } else {
               return l0.value < l1.value
            }
        }
                        
        var result = [[Int]]()
        result.append([Int]())
        var prevX = locations[0].x
        for l in locations {
            if l.x != prevX {
                prevX = l.x
                result.append([l.value])
            } else {
                var last = result.removeLast()
                last.append(l.value)
                result.append(last)
            }
            
        }
        return result
    }
    
    private func dfs(_ node: TreeNode?, _ x: Int, _ y: Int) {
        guard let node = node else { return }
        locations.append((x: x, y: y, value: node.val))
        dfs(node.left, x-1, y-1)
        dfs(node.right, x+1, y-1)
    }
}