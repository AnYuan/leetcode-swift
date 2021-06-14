/*
 19.Remove Nth Node From End of List

 Given a linked list, remove the n-th node from the end of list and return its head.

 Example:

 Given linked list: 1->2->3->4->5, and n = 2.

 After removing the second node from the end, the linked list becomes 1->2->3->5.

 Note:

 Given n will always be valid.

 Follow up:

 Could you do this in one pass?

 https://leetcode.com/problems/remove-nth-node-from-end-of-list/
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {

        guard let head = head, let _ = head.next else { return nil }

        let start = ListNode(0)
        start.next = head
        var fast: ListNode? = start
        var slow: ListNode? = start

        // move fast first
        for i in 0..<n {
            fast = fast?.next
        }

        // move fast and slow until list end
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        // remove target
        var remove = slow?.next
        slow?.next = remove?.next
        remove = nil

        return start.next
    }
}
