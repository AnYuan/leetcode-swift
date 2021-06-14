/*
 143. Reorder List

 Given a singly linked list L: L0→L1→…→Ln-1→Ln,
 reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…

 You may not modify the values in the list's nodes, only nodes itself may be changed.

 Example 1:

 Given 1->2->3->4, reorder it to 1->4->2->3.
 Example 2:

 Given 1->2->3->4->5, reorder it to 1->5->2->4->3.

 https://leetcode.com/problems/reorder-list/
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

    private func detachBack(of list: ListNode?) -> ListNode? {
        var slow = list
        var fast = list
        var prev = list
        while fast != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prev?.next = nil
        return slow
    }

    private func reverseList(_ head: ListNode?) -> ListNode? {
        guard let h = head, let _ = h.next else { return head }
        let dummy = ListNode(0)
        dummy.next = head

        var n: ListNode? = head?.next
        var p: ListNode? = head

        while n != nil {
            let h = dummy.next
            p?.next = n?.next
            dummy.next = n
            n?.next = h

            n = p?.next
        }
        return dummy.next
    }

    private func merge(front: ListNode?, back: ListNode?) {
        var front = front
        var back = back
        while front != nil && back != nil {
            let frontNext = front?.next
            front?.next = back
            front = frontNext
            let backNext = back?.next
            back?.next = front
            back = backNext
        }
    }

    func reorderList(_ head: ListNode?) {
        // three steps
        // 0. find middle
        // 1. reverse sec half
        // 2. merge two
        let secondHalf = detachBack(of: head)
        let back = reverseList(secondHalf)
        merge(front: head, back: back)
    }
}
