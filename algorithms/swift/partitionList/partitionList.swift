/*
 86. Partition List

 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

 You should preserve the original relative order of the nodes in each of the two partitions.

 Example:

 Input: head = 1->4->3->2->5->2, x = 3
 Output: 1->2->2->4->3->5

 https://leetcode.com/problems/partition-list/
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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {

        // split two linkedList,
        // one less than x, one equal or greater than x
        // traverse head, append to list1 and list2
        // then link two list
        // warning: avoid cycle when merging two lists
        var dummy1 = ListNode(0), dummy2 = ListNode(0), head = head
        var list1:ListNode? = dummy1
        var list2:ListNode? = dummy2
        while head != nil {
            if head!.val < x {
                list1?.next = head
                list1 = list1?.next
            } else {
                list2?.next = head
                list2 = list2?.next
            }
            head = head?.next
        }

        // avoid cycle
        list2?.next = nil
        list1?.next = dummy2.next

        return dummy1.next
    }
}
