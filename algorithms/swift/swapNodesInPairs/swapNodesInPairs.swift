/*
 Given a linked list, swap every two adjacent nodes and return its head.

 You may not modify the values in the list's nodes, only nodes itself may be changed.

 Example:
 Given 1->2->3->4, you should return the list as 2->1->4->3.

 https://leetcode.com/problems/swap-nodes-in-pairs/
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
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let _ = head?.next else { return head }

        let first = head?.next
        var curr = head
        var temp: ListNode?
        var prev: ListNode?

        while curr?.next != nil {
            temp = curr?.next
            curr?.next = temp?.next
            temp?.next = curr
            prev?.next = temp

            prev = curr
            curr = curr?.next
        }

        return first
    }
}
