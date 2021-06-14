/*
 445. Add Two Numbers II

 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Follow up:
 What if you cannot modify the input lists? In other words, reversing the lists is not allowed.

 Example:

 Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 8 -> 0 -> 7

 https://leetcode.com/problems/add-two-numbers-ii/
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

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var rl1 = reverse(l1)
        var rl2 = reverse(l2)
        var c1 = rl1
        var c2 = rl2

        var carry = 0
        var dummy = ListNode(0)
        var result = dummy

        while c1 != nil || c2 != nil {
            var sum = 0
            if let c1 = c1 {
                sum += c1.val
            }
            if let c2 = c2 {
                sum += c2.val
            }
            sum += carry

            result.next = ListNode(sum % 10)
            carry = sum / 10

            c1 = c1?.next
            c2 = c2?.next
            result = result.next!
        }

        if carry == 1 {
            result.next = ListNode(1)
        }
        return reverse(dummy.next)
    }
}
