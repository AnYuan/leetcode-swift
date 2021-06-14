/*
 21. Merge Two Sorted Lists

 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

 Example:

 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4

 https://leetcode.com/problems/merge-two-sorted-lists/
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard var l1 = l1 else { return l2 }
        guard var l2 = l2 else { return l1 }

        var h1: ListNode? = l1
        var h2: ListNode? = l2
        let dummy = ListNode(0)
        var current: ListNode? = dummy
        while h1 != nil, h2 != nil {
            if h1!.val < h2!.val {
                current?.next = h1
                h1 = h1?.next
            } else {
                current?.next = h2
                h2 = h2?.next
            }
            current = current?.next
        }

        if let h1 = h1 {
            current?.next = h1
        }

        if let h2 = h2 {
            current?.next = h2
        }

        return dummy.next
    }
}
