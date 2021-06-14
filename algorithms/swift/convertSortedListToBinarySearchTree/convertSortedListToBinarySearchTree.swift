/*
 109. Convert Sorted List to Binary Search Tree

 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

 Example:

 Given the sorted linked list: [-10,-3,0,5,9],

 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

     0
    / \
   -3   9
   /   /
  -10  5

  https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
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
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard let _ = head else { return nil }
        var current = head
        var array = [Int]()
        while let c = current {
            array.append(c.val)
            current = c.next
        }
        return helper(0, array.endIndex-1, array)

    }

    func helper(_ startIndex:Int, _ endIndex:Int, _ array: [Int]) -> TreeNode? {
        guard endIndex >= startIndex else { return nil }
        let midIndex = (startIndex + endIndex) / 2
        let node = TreeNode(array[midIndex])
        node.left = helper(startIndex, midIndex-1, array)
        node.right = helper(midIndex+1, endIndex, array)
        return node
    }
}

