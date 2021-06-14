/*
1257. Smallest Common Region

You are given some lists of regions where the first region of each list includes all other regions in that list.

Naturally, if a region X contains another region Y then X is bigger than Y. Also by definition a region X contains itself.

Given two regions region1, region2, find out the smallest region that contains both of them.

If you are given regions r1, r2 and r3 such that r1 includes r3, it is guaranteed there is no r2 such that r2 includes r3.

It's guaranteed the smallest region exists.

 

Example 1:

Input:
regions = [["Earth","North America","South America"],
["North America","United States","Canada"],
["United States","New York","Boston"],
["Canada","Ontario","Quebec"],
["South America","Brazil"]],
region1 = "Quebec",
region2 = "New York"
Output: "North America"

 

Constraints:

    2 <= regions.length <= 10^4
    region1 != region2
    All strings consist of English letters and spaces with at most 20 letters.

https://leetcode.com/problems/smallest-common-region/
*/
class Solution {

    var graph = [String: [String]]()

    func findSmallestRegion(_ regions: [[String]], _ region1: String, _ region2: String) -> String {
        for var r in regions {
            let k = r.removeFirst()
            for c in r {
                graph[k, default: [String]()].append(c)
            }
        }
        let root = regions[0][0]
        let result = helper(root, region1, region2)
        return result == nil ? root : result!
    }
    
    func helper(_ node: String, _ r1: String, _ r2: String) -> String? {
        if node == r1 || node == r2 { return node }   
        var temp = [String?]()
        for r in graph[node, default: [String()]] where !r.isEmpty {
            temp.append(helper(r, r1, r2))
        }
        let r = temp.compactMap { $0 }
        if r.count == 1 {
            return r[0]
        } else if r.count == 2 {
            return node
        } else {
            return nil
        }
    }
}