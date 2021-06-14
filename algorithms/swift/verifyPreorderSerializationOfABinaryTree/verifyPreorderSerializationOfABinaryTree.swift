/*
 331. Verify Preorder Serialization of a Binary Tree

 One way to serialize a binary tree is to use pre-order traversal. When we encounter a non-null node, we record the node's value. If it is a null node, we record using a sentinel value such as #.

     _9_
    /   \
   3     2
   / \   / \
  4   1  #  6
 / \ / \   / \
 # # # #   # #

 For example, the above binary tree can be serialized to the string "9,3,4,#,#,1,#,#,2,#,6,#,#", where # represents a null node.

 Given a string of comma separated values, verify whether it is a correct preorder traversal serialization of a binary tree. Find an algorithm without reconstructing the tree.

 Each comma separated value in the string must be either an integer or a character '#' representing null pointer.

 You may assume that the input format is always valid, for example it could never contain two consecutive commas such as "1,,3".

 Example 1:

 Input: "9,3,4,#,#,1,#,#,2,#,6,#,#"
 Output: true
 Example 2:

 Input: "1,#"
 Output: false
 Example 3:

 Input: "9,#,#,1"
 Output: false

 https://leetcode.com/problems/verify-preorder-serialization-of-a-binary-tree/
 */
class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        var nodes = preorder.split(separator: ",")
        // when insert a node in binary tree, we decrease the counter
        // when we insert an integer, we increase the counter by 2
        // when we insert a "#", we decrease the counter by 1
        // in the end, if we have counter == 2, it's a valid binary tree
        var counter = 1
        for node in nodes {
            counter -= 1
            if counter < 0 { return false }
            if node != "#" {
                counter += 2
            }
        }
        return counter == 0
    }
}
