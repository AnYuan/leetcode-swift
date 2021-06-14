/*
742. Closest Leaf in a Binary Tree

Given a binary tree where every node has a unique value, and a target key k, find the value of the nearest leaf node to target k in the tree.

Here, nearest to a leaf means the least number of edges travelled on the binary tree to reach any leaf of the tree. Also, a node is called a leaf if it has no children.

In the following examples, the input tree is represented in flattened form row by row. The actual root tree given will be a TreeNode object.

Example 1:

Input:
root = [1, 3, 2], k = 1
Diagram of binary tree:
          1
         / \
        3   2

Output: 2 (or 3)

Explanation: Either 2 or 3 is the nearest leaf node to the target of 1.

Example 2:

Input:
root = [1], k = 1
Output: 1

Explanation: The nearest leaf node is the root node itself.

Example 3:

Input:
root = [1,2,3,4,null,null,null,5,null,6], k = 2
Diagram of binary tree:
             1
            / \
           2   3
          /
         4
        /
       5
      /
     6

Output: 3
Explanation: The leaf node with value 3 (and not the leaf node with value 6) is nearest to the node with value 2.

Note:

    root represents a binary tree with at least 1 node and at most 1000 nodes.
    Every node has a unique node.val in range [1, 1000].
    There exists some node in the given binary tree for which node.val == k.

https://leetcode.com/problems/closest-leaf-in-a-binary-tree/
https://leetcode.com/problems/closest-leaf-in-a-binary-tree/discuss/109934/Intuitive-Python-O(n)-BFS-on-Undirected-Graph
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
class Solution {
            
    var graph = [Int: [Int]]() // val : [nodes]
    var leaves = Set<Int>()

    // transform binary tree to undirected graph
    // then bfs the target
    func findClosestLeaf(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else { return 0 }

        traverse(root)
        var queue = [k]
        var visited = Set<Int>()
        while !queue.isEmpty {
            let node = queue.removeFirst()
            visited.insert(node)
            if leaves.contains(node) {
                return node
            }
            for n in graph[node]! where !visited.contains(n) {
                queue.append(n)
            }
        }
        return -1 // should not reach here
    }
    
    func traverse(_ node: TreeNode?) {    
        guard let node = node else { return }
        if node.left == nil, node.right == nil {
            leaves.insert(node.val)
        }
        if let left = node.left {
            if var val = graph[node.val] {
                val.append(left.val)
                graph[node.val] = val
            } else {
                graph[node.val] = [left.val]
            }
            
            graph[node.val, defalut: [left.val]] += left.val
            
            if var val = graph[left.val] {
                val.append(node.val)
                graph[left.val] = [node.val]
            } else {
                graph[left.val] = [node.val]
            }
            traverse(left)
        }
        
        if let right = node.right {
            if var val = graph[node.val] {
                val.append(right.val)
                graph[node.val] = val
            } else {
                graph[node.val] = [right.val]
            }
            
            if var val = graph[right.val] {
                val.append(node.val)
                graph[right.val] = val
            } else {
                graph[right.val] = [node.val]
            }
            traverse(right)
        }
    }
}