/*
 Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.

 Note: 
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

 Example 1:

 Input: root = [3,1,4,null,2], k = 1
  3
 / \
 1   4
 \
 2
 Output: 1

 Example 2:

 Input: root = [5,3,6,2,4,null,null,1], k = 3
  5
 / \
 3   6
 / \
 2   4
 /
 1
 Output: 3

 Follow up:

 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
 */

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    guard let root = root else { return 0 }
    var result: Int = 0
    var k = k
    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }

        dfs(root.left)
        k = k - 1
        if k == 0 {
            result = root.val
            return
        }
        dfs(root.right)
    }
    // inorder tree
    dfs(root)

    return result
}


class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var node = root
        var count = k
        var stack = [TreeNode?]()
        while true {
            while node != nil {
                stack.append(node)
                node = node?.left
            }
            node = stack.removeLast()
            count -= 1
            if count == 0 {
                return node!.val
            }
            node = node?.right
        }
        
    }
}