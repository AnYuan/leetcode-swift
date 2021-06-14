/*
 337. House Robber III

 The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.

 Determine the maximum amount of money the thief can rob tonight without alerting the police.

 Example 1:

 Input: [3,2,3,null,3,null,1]

     3
    / \
   2   3
    \   \
     3   1

 Output: 7
 Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
 Example 2:

 Input: [3,4,5,1,3,null,1]

     3
    / \
   4   5
  / \   \
 1   3   1

 Output: 9
 Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.

 https://leetcode.com/problems/house-robber-iii/
 https://leetcode.com/problems/house-robber-iii/discuss/79330/Step-by-step-tackling-of-the-problem
 */
class Solution {
    func rob(_ root: TreeNode?) -> Int {
        let result = _rob(root)
        return max(result.0, result.1)
    }

    private func _rob(_ node: TreeNode?) -> (Int, Int) {
        guard let node = node else { return (0,0) }
        let lhs = _rob(node.left)
        let rhs = _rob(node.right)
        let robRoot = node.val + lhs.1 + rhs.1 // root + notRobRoot left + notRobRoot Right
        let notRobRoot = max(lhs.0, lhs.1) + max(rhs.0, rhs.1)
        return (
          robRoot,
          notRobRoot
        )
    }
}
