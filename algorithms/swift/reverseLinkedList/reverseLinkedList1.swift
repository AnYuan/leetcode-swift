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
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let h = head, let _ = h.next else { return head }
        let p = reverseList(h.next)
        h.next?.next = h
        h.next = nil
        return p
    }
}
