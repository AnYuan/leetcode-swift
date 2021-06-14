/*
449. Serialize and Deserialize BST

Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

Design an algorithm to serialize and deserialize a binary search tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary search tree can be serialized to a string and this string can be deserialized to the original tree structure.

The encoded string should be as compact as possible.

Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.

https://leetcode.com/problems/serialize-and-deserialize-bst/
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else { return "null" }
        var result = "\(root.val)"
        return result + "," + serialize(root.left) + "," + serialize(root.right)
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        guard !data.isEmpty else { return nil }
        var s = data.split(separator: ",").map{String($0)}
        return _deserialize(&s)
    }
    
    func _deserialize(_ s: inout [String]) -> TreeNode? {
        guard !s.isEmpty else { return nil }
        var val = s.removeFirst()
        
        if val == "null" {
            return nil
        }
        let node = TreeNode(Int(val)!)
        node.left = _deserialize(&s)
        node.right = _deserialize(&s)
        return node
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.serialize(root)
 * let ans = obj.serialize(s)
*/