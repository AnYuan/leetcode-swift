/*
297. Serialize and Deserialize Binary Tree

Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

Example: 

You may serialize the following tree:

    1
   / \
  2   3
     / \
    4   5

as "[1,2,3,null,null,4,5]"

Clarification: The above format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.

https://leetcode.com/problems/serialize-and-deserialize-binary-tree/
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
	func serialize(_ root: TreeNode?) -> String {
		//using preorder traversal
		guard let root = root else { return "null," }
		let result = String(root.val)
		let left = serialize(root.left)
		let right = serialize(root.right)
		return result + "," + left + right
	}

	func deserialize(_ string: String) -> TreeNode? {
		var strs:[String] = string.split(separator: ",").map {String($0)}
		return _deserialize(&strs)
	}

	private func _deserialize(_ strings: inout [String]) -> TreeNode? {
		guard !strings.isEmpty else { return nil }
		let val = strings.removeFirst()
		if val == "null" { return nil }
		let node = TreeNode(Int(val)!)
		node.left = _deserialize(&strings)
		node.right = _deserialize(&strings)
		return node
	}
}
