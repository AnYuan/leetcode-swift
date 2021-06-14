/*
 Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

 Given binary search tree:  root = [6,2,8,0,4,7,9,null,null,3,5]

 e.g. 1

 Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
 Output: 6
 Explanation: The LCA of nodes 2 and 8 is 6.


 e.g. 2

 Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
 Output: 2
 Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.


 https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 */

func lowestCommonAncestor(root: TreeNode?, p: TreeNode?, q: TreeNode?) -> TreeNode? {

    guard let root = root else { return nil }
    guard let p = p else { return nil }
    guard let q = q else { return nil }


    if root.val > max(p.val, q.val) {
        return lowestCommonAncestor(root: root.left, p: p, q: q)
    } else if root.val < min(p.val, q.val) {
        return lowestCommonAncestor(root: root.right, p: p, q: q)
    } else { return root }
}
