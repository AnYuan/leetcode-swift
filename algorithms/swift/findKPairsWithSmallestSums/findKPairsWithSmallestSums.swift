/*
 You are given two integer arrays nums1 and nums2 sorted in ascending order and an integer k.

 Define a pair (u,v) which consists of one element from the first array and one element from the second array.

 Find the k pairs (u1,v1),(u2,v2) ...(uk,vk) with the smallest sums.

 Example 1:
 Input: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
 Output: [[1,2],[1,4],[1,6]] 
 Explanation: The first 3 pairs are returned from the sequence: 
 [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]

 Example 2:

 Input: nums1 = [1,1,2], nums2 = [1,2,3], k = 2
 Output: [1,1],[1,1]
 Explanation: The first 2 pairs are returned from the sequence: 
 [1,1],[1,1],[1,2],[2,1],[1,2],[2,2],[1,3],[1,3],[2,3]

 Example 3:

 Input: nums1 = [1,2], nums2 = [3], k = 3
 Output: [1,3],[2,3]
 Explanation: All possible pairs are returned from the sequence: [1,3],[2,3]
 */

struct Pair: Hashable {
    let i: Int
    let j: Int
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}

func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {

    var dic = [Pair:Int]()
    for i in 0..<nums1.count {
        for j in 0..<nums2.count {
            dic[Pair(i,j)] = nums1[i] + nums2[j]
        }
    }

    var sorted = dic.sorted{ $0.value < $1.value }

    var result = [[Int]]()
    for _ in 0..<k where !sorted.isEmpty {
        let p = sorted.removeFirst()
        result.append([nums1[p.key.i], nums2[p.key.j]])
    }
    return result
}
