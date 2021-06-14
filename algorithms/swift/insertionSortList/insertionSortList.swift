/*
 147. Insertion Sort List

 Sort a linked list using insertion sort.

 Algorithm of Insertion Sort:

 Insertion sort iterates, consuming one input element each repetition, and growing a sorted output list.
 At each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list, and inserts it there.
 It repeats until no input elements remain.

 Example 1:

 Input: 4->2->1->3
 Output: 1->2->3->4
 Example 2:

 Input: -1->5->3->4->0
 Output: -1->0->3->4->5

 https://leetcode.com/problems/insertion-sort-list/
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
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        let dummy = ListNode(Int.min)
        dummy.next = head

        var sorted = head
        while let p = sorted.next {
            if p.val < sorted.val {
                var prev = dummy, curr = dummy.next
                while curr!.val <= p.val {
                    prev = curr!
                    curr = curr!.next
                }
                sorted.next = p.next
                prev.next = p
                p.next = curr
            } else {
                sorted = p
            }
        }
        return dummy.next
    }
}
