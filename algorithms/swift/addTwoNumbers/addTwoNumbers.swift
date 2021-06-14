//
//  addTwoNumbers.swift
//
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 https://leetcode.com/problems/add-two-numbers/
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let result = ListNode(0);
        var current:ListNode? = result
        var needAddOne = false
        while (l1 != nil || l2 != nil) {

            var v1 = 0
            if let l1 = l1 {
                v1 = l1.val
            }
            var v2 = 0
            if let l2 = l2 {
                v2 = l2.val
            }

            var v = v1 + v2
            if (needAddOne) { v += 1 }
            if v >= 10 {
                v = v - 10
                needAddOne = true
            } else {
                needAddOne = false
            }

            current?.next = ListNode(v)
            l1 = l1?.next
            l2 = l2?.next
            current = current?.next
        }

        if needAddOne {
            current?.next = ListNode(1)
        }

        return result.next
    }
}
