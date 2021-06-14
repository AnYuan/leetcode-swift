/*
 148. Sort List

 Sort a linked list in O(n log n) time using constant space complexity.

 Example 1:

 Input: 4->2->1->3
 Output: 1->2->3->4

 Example 2:

 Input: -1->5->3->4->0
 Output: -1->0->3->4->5

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

 https://leetcode.com/problems/sort-list/
 */
class Solution {
    func sortList(_ h: ListNode?) -> ListNode? {
        guard let head = h, let next = head.next else { return h }
        var prev: ListNode?
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast != nil, fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prev?.next = nil
        var l0 = sortList(head)
        var l1 = sortList(slow)
        return merge(l0, l1)
    }
    
    func merge(_ l0: ListNode?, _ l1: ListNode?) -> ListNode? {
        if l0 == nil {
            return l1
        }
        if l1 == nil {
            return l0
        }
        var l0 = l0
        var l1 = l1
        var dummy = ListNode(0)
        var current: ListNode? = dummy
        while l0 != nil && l1 != nil {
            if l0!.val <= l1!.val {
                current?.next = l0
                l0 = l0?.next
            } else {
                current?.next = l1
                l1 = l1?.next
            }
            current = current?.next
        }
        
        if l0 != nil {
            current?.next = l0
        }
        if l1 != nil {
            current?.next = l1
        }
        
        return dummy.next
    }
}