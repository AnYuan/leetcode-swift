/*
 Given a linked list, determine if it has a cycle in it.

 To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

 https://leetcode.com/problems/linked-list-cycle/
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func hasCycle(_ head: ListNode?) -> Bool {

    guard let _ = head else { return false }

    var slow = head
    var fast = head

    while (fast?.next != nil && fast?.next?.next != nil) {
        slow = slow?.next
        fast = fast?.next?.next

        if (slow === fast) { return true }
    }
    return false
}
