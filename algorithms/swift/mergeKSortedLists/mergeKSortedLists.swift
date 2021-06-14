/*
23. Merge k Sorted Lists

Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

Example:

Input:
[
  1->4->5,
  1->3->4,
  2->6
]
Output: 1->1->2->3->4->4->5->6

https://leetcode.com/problems/merge-k-sorted-lists/
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var sorted = [Int]()
        for list in lists.compactMap ({ $0 }) {
            var head: ListNode? = list
            while head != nil {
                sorted.append(head!.val)
                head = head?.next
            }
        }
        
        sorted.sort()
        
        guard !sorted.isEmpty else {
            return nil
        }
        var dummy = ListNode(0)
        var current: ListNode? = ListNode(sorted[0])
        dummy.next = current
        for n in sorted.dropFirst() {
            
            let tmp: ListNode? = ListNode(n)
            current?.next = tmp
            current = current?.next
        }
        return dummy.next
    }
}