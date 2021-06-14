/*
 92. Reverse Linked List II

 Reverse a linked list from position m to n. Do it in one-pass.

 Note: 1 ≤ m ≤ n ≤ length of list.

 Example:

 Input: 1->2->3->4->5->NULL, m = 2, n = 4
 Output: 1->4->3->2->5->NULL

 https://leetcode.com/problems/reverse-linked-list-ii/
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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        guard m != n else {
            return head
        }
        
        var current = head
        var head = head
        var prev: ListNode? = nil
        for _ in 0..<m-1 where current != nil {
            prev = current
            current = current?.next
        }
            
        // we are interested in three parts of the LinkedList, part before index 'm', part between 'm' and 
        // 'n', and the part after index 'n'
        var lastNodeOfFirstPart = prev

        // after reversing the LinkedList 'current' will become the last node of the sub-list
        var lastNodeOfSubList = current
        var next: ListNode? = nil
            
        // reverse nodes between 'm' and 'n'
        for i in 0..<n-m+1 where current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        if lastNodeOfFirstPart != nil {
            lastNodeOfFirstPart?.next = prev
        } else {
            head = prev
        }
        
        lastNodeOfSubList?.next = current
        
        return head
    }
}
