/*
 Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

 To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

 Note: Do not modify the linked list.

 https://leetcode.com/problems/linked-list-cycle-ii/
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func detectCycle(_ head: ListNode?) -> ListNode? {
    guard let _ = head else { return nil }

    var slow = head
    var fast = head
    var hasCycle = false

    while (fast?.next != nil && fast?.next?.next != nil) {
        slow = slow?.next
        fast = fast?.next?.next

        if (slow === fast) {
            hasCycle = true
            break
        }
    }

    if (!hasCycle) { return nil }
    //reset slow, to detect cycle entrance
    slow = head
    while (slow !== fast) {
        slow = slow?.next
        fast = fast?.next
    }
    return fast
}
