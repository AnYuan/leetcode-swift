/*
 450. Delete Node in a BST

 Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

 Basically, the deletion can be divided into two stages:

 Search for a node to remove.
 If the node is found, delete the node.
 Note: Time complexity should be O(height of tree).

 Example:

 root = [5,3,6,2,4,null,7]
 key = 3

  5
 / \
 3   6
 / \   \
 2   4   7

 Given key to delete is 3. So we find the node with value 3 and delete it.

 One valid answer is [5,4,6,2,null,null,7], shown in the following BST.

    5
   /  \
  4    6
 /      \
 2       7

 Another valid answer is [5,2,6,null,4,null,7].

  5
 / \
 2   6
 \   \
 4   7
 */

func successor(_ root: TreeNode?) -> Int {
    var root = root?.right
    while root?.left != nil {
        root = root?.left
    }
    return root!.val
}

func predecessor(_ root: TreeNode?) -> Int {
    var root = root?.left
    while root?.right != nil {
        root = root?.right
    }
    return root!.val
}

func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let r = root else { return nil }
    var root: TreeNode? = root
    if key > r.val {
        r.right = deleteNode(r.right, key)
    } else if key < r.val {
        r.left = deleteNode(r.left, key)
    } else {
        // leaf node
        if r.left == nil && r.right == nil {
            root = nil
        } else if r.left == nil {
            r.val = successor(r)
            r.right = deleteNode(r.right, r.val)
        } else {
            r.val = predecessor(r)
            r.left = deleteNode(r.left, r.val)
        }
    }
    return root
}

