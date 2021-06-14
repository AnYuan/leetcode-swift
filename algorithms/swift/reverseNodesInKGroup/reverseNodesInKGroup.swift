
/*
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.

 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

 https://leetcode.com/problems/reverse-nodes-in-k-group/
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard let _ = head else { return head }
    guard k > 1 else { return head }

    let (first, last) = divide(head: head, length: k)
    guard let _ = last else { return first }

    let current = last?.next
    let (r_first, r_last) = reverse(head: first, tail: last)
    r_last?.next = reverseKGroup(current, k)
    return r_first
}

func divide(head: ListNode?, length: Int) -> (ListNode?, ListNode?) {
    var last = head
    for _ in 1..<length {
        last = last?.next
        if last == nil { break }
    }
    return (head, last)
}

func reverse(head: ListNode?, tail: ListNode?) -> (ListNode?, ListNode?) {
    var prev: ListNode?
    let tailNext = tail?.next
    var current = head
    var next: ListNode?
    while current !== tailNext {
        next = current?.next
        current?.next = prev
        prev = current
        current = next
    }
    return (prev, head)
}
