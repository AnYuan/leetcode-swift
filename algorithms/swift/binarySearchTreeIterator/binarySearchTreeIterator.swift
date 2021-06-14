/*
 173. Binary Search Tree Iterator

 Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.

 Calling next() will return the next smallest number in the BST.

 Example:

 BSTIterator iterator = new BSTIterator(root);
 iterator.next();    // return 3
 iterator.next();    // return 7
 iterator.hasNext(); // return true
 iterator.next();    // return 9
 iterator.hasNext(); // return true
 iterator.next();    // return 15
 iterator.hasNext(); // return true
 iterator.next();    // return 20
 iterator.hasNext(); // return false

 Note:

 * next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.

 * You may assume that next() call will always be valid, that is, there will be at least a next smallest number in the BST when next() is called.

 https://leetcode.com/problems/binary-search-tree-iterator/
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

class BSTIterator {

    var array = [Int]()

    init(_ root: TreeNode?) {
        dfs(root)
    }

    /** @return the next smallest number */
    func next() -> Int {
        return array.removeFirst()
    }

    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return !array.isEmpty
    }

    private func dfs(_ root: TreeNode?) {
        guard let root = root else { return }
        dfs(root.left)
        array.append(root.val)
        dfs(root.right)
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
