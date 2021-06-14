/*
 369. Plus One Linked List

 Given a non-negative integer represented as non-empty a singly linked list of digits, plus one to the integer.

 You may assume the integer do not contain any leading zero, except the number 0 itself.

 The digits are stored such that the most significant digit is at the head of the list.

 Example :

 Input: [1,2,3]
 Output: [1,2,4]

 https://leetcode.com/problems/plus-one-linked-list/
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

    private func reverse(_ head: ListNode?) -> ListNode? {
        var first: ListNode?
        var current = head
        var temp: ListNode?

        while current != nil {
            temp = current?.next
            current?.next = first
            first = current
            current = temp
        }
        return first
    }

    func plusOne(_ head: ListNode?) -> ListNode? {
        var dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var reversed = reverse(dummy)
        var current = reversed
        while var r = current {
            if r.val == 9 {
                r.val = 0
            } else {
                r.val += 1
                break
            }
            current = current?.next
        }
        dummy = reverse(reversed)
        return dummy!.val == 0 ? dummy?.next : dummy
    }
}
