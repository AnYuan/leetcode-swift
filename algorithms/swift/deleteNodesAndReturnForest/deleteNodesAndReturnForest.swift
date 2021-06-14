/*
 1110. Delete Nodes And Return Forest

 Given the root of a binary tree, each node in the tree has a distinct value.

 After deleting all nodes with a value in to_delete, we are left with a forest (a disjoint union of trees).

 Return the roots of the trees in the remaining forest.  You may return the result in any order.


 Example 1:

 Input: root = [1,2,3,4,5,6,7], to_delete = [3,5]
 Output: [[1,2,null,4],[6],[7]]

 Constraints:

 * The number of nodes in the given tree is at most 1000.
 * Each node has a distinct value between 1 and 1000.
 * to_delete.length <= 1000
 * to_delete contains distinct values between 1 and 1000.

 https://leetcode.com/problems/delete-nodes-and-return-forest/
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
    var deleteNodes = Set<Int>()
    var result = [TreeNode?]()
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        // init set
        deleteNodes = Set<Int>(to_delete)
        helper(root, true)
        return result
    }

    private func helper(_ node: TreeNode?, _ isRoot: Bool) -> TreeNode? {
        guard let node = node else { return nil }
        let deleted = deleteNodes.contains(node.val)
        if !deleted && isRoot {
            result.append(node)
        }
        node.left = helper(node.left, deleted)
        node.right = helper(node.right, deleted)
        return deleted ? nil : node
    }
}
