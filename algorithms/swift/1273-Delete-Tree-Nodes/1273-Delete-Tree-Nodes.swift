/*
1273. Delete Tree Nodes

A tree rooted at node 0 is given as follows:

    The number of nodes is nodes;
    The value of the i-th node is value[i];
    The parent of the i-th node is parent[i].

Remove every subtree whose sum of values of nodes is zero.

After doing so, return the number of nodes remaining in the tree.

 

Example 1:

Input: nodes = 7, parent = [-1,0,0,1,2,2,2], value = [1,-2,4,0,-2,-1,-1]
Output: 2

Example 2:

Input: nodes = 7, parent = [-1,0,0,1,2,2,2], value = [1,-2,4,0,-2,-1,-2]
Output: 6

Example 3:

Input: nodes = 5, parent = [-1,0,1,0,0], value = [-672,441,18,728,378]
Output: 5

Example 4:

Input: nodes = 5, parent = [-1,0,0,1,1], value = [-686,-842,616,-739,-746]
Output: 5

 

Constraints:

    1 <= nodes <= 10^4
    parent.length == nodes
    0 <= parent[i] <= nodes - 1
    parent[0] == -1 which indicates that 0 is the root.
    value.length == nodes
    -10^5 <= value[i] <= 10^5
    The given input is guaranteed to represent a valid tree.

https://leetcode.com/problems/delete-tree-nodes/
*/
class Solution {
    func deleteTreeNodes(_ nodes: Int, _ parent: [Int], _ value: [Int]) -> Int {
        // parent : [children]
        var dict = [Int: Set<Int>]()
        for n in 0..<nodes {
            dict[parent[n], default: Set<Int>()].insert(n)
        }
        return dfs(dict, 0, value).1
    }
    
    // return (Sum, Count)
    func dfs(_ dict: [Int: Set<Int>], _ node: Int, _ value: [Int]) -> (Int, Int) {
        var sum = value[node]
        var count = 1
        for c in dict[node, default: Set<Int>()] {
            let pair = dfs(dict, c, value)
            sum += pair.0
            count += pair.1
        }
        // if sum == 0, the numnber of nodes remaining in the tree is 0
        if sum == 0 {
            count = 0
        }
        return (sum, count)
    }
}