/*
Given preorder and inorder traversal of a tree, construct the binary tree.

Note:
You may assume that duplicates do not exist in the tree.

For example, given

preorder = [3,9,20,15,7]
inorder = [9,3,15,20,7]
Return the following binary tree:

    3
   / \
  9  20
    /  \
   15   7

https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
*/
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 1 else { return preorder.isEmpty ? nil : TreeNode(preorder[0]) }
        
        let root = TreeNode(preorder[0])
        let rootInOrderIndex = inorder.firstIndex(of: preorder[0])!
        var leftPreOrder: [Int] = [Int]()
        var rightPreOrder: [Int] = [Int]()
        
        var leftInOrder: [Int] = [Int]()
        var rightInOrder: [Int] = [Int]()
    
        if rootInOrderIndex != 0 { // no left subtree
            leftPreOrder = Array(preorder[1...rootInOrderIndex])
            leftInOrder = Array(inorder[0..<rootInOrderIndex])
        }
        
        if rootInOrderIndex != inorder.endIndex { // no right subtree
            rightPreOrder = Array(preorder[1+rootInOrderIndex..<preorder.endIndex])
            rightInOrder = Array(inorder[rootInOrderIndex+1..<preorder.endIndex])
        }
        
        root.left = buildTree(leftPreOrder, leftInOrder)
        root.right = buildTree(rightPreOrder, rightInOrder)
        
        return root
    }