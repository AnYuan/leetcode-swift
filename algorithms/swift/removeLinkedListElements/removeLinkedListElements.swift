/*
 203. Remove Linked List Elements

 Remove all elements from a linked list of integers that have value val.

 Example:

 Input:  1->2->6->3->4->5->6, val = 6
 Output: 1->2->3->4->5

 https://leetcode.com/problems/remove-linked-list-elements/
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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else { return nil }
        var dummy = ListNode(0)
        dummy.next = head
        var node: ListNode? = dummy
        while node?.next != nil {
            if node?.next?.val == val {
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }
        return dummy.next
    }
}
