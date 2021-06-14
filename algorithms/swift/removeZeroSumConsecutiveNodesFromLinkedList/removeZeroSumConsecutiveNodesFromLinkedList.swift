/*
 1171. Remove Zero Sum Consecutive Nodes from Linked List

 Given the head of a linked list, we repeatedly delete consecutive sequences of nodes that sum to 0 until there are no such sequences.

 After doing so, return the head of the final linked list.  You may return any such answer.

 (Note that in the examples below, all sequences are serializations of ListNode objects.)

 Example 1:

 Input: head = [1,2,-3,3,1]
 Output: [3,1]
 Note: The answer [1,2,1] would also be accepted.

 Example 2:

 Input: head = [1,2,3,-3,4]
 Output: [1,2,4]
 Example 3:

 Input: head = [1,2,3,-3,-2]
 Output: [1]


 Constraints:

 * The given linked list will contain between 1 and 1000 nodes.
 * Each node in the linked list has -1000 <= node.val <= 1000.

 https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/
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
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var prefix = 0
        var current: ListNode? = dummy
        var cache = Dictionary<Int, ListNode>()
        while let c = current {
            prefix += c.val
            if cache.keys.contains(prefix) {
                current = cache[prefix]!.next
                var p = prefix + current!.val
                while p != prefix {
                    cache.removeValue(forKey: p)
                    current = current?.next
                    p += current!.val
                }
                cache[prefix]!.next = current?.next
            } else {
                cache[prefix] = current
            }
            current = current?.next
        }
        return dummy?.next
    }
}
