/*
1367. Linked List in Binary Tree

Given a binary tree root and a linked list with head as the first node. 

Return True if all the elements in the linked list starting from the head correspond to some downward path connected in the binary tree otherwise return False.

In this context downward path means a path that starts at some node and goes downwards.

 

Example 1:

Input: head = [4,2,8], root = [1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]
Output: true
Explanation: Nodes in blue form a subpath in the binary Tree.  

Example 2:

Input: head = [1,4,2,6], root = [1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]
Output: true

Example 3:

Input: head = [1,4,2,6,8], root = [1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]
Output: false
Explanation: There is no path in the binary tree that contains all the elements of the linked list from head.

 

Constraints:

    1 <= node.val <= 100 for each node in the linked list and binary tree.
    The given linked list will contain between 1 and 100 nodes.
    The given binary tree will contain between 1 and 2500 nodes.

https://leetcode.com/problems/linked-list-in-binary-tree/
*/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
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
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let head = head else { return true }
        guard let root = root else { return false }
        return dfs(head, root) || isSubPath(head, root.left) || isSubPath(head, root.right)
    }
    
    func dfs(_ head: ListNode?, _ root: TreeNode?) -> Bool {             
        guard let head = head else { return true }
        guard let root = root else { return false }
        
        return (head.val == root.val) && (dfs(head.next, root.left) || (dfs(head.next, root.right)))
    }
}