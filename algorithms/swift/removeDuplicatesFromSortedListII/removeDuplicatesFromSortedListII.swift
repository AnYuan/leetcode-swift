/*
 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.

 Example 1:

 Input: 1->2->3->3->4->4->5
 Output: 1->2->5

 Example 2:

 Input: 1->1->1->2->3
 Output: 2->3

 https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
 */

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var prev: ListNode? = dummy
    var fast: ListNode? = dummy.next
    while prev?.next != nil {
        // skip all duplicate
        while fast != nil, fast?.val == fast?.next?.val {
            fast = fast?.next
        }
        // no duplicate
        if prev?.next === fast {
            prev = prev?.next
        } else {
            // remove duplicate
            prev?.next = fast?.next
        }
        // move fast
        fast = fast?.next
    }
    return dummy.next
}
