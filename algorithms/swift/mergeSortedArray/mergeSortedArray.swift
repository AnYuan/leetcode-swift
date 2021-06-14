/*
 88. Merge Sorted Array

 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

 Note:

 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
 Example:

 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 Output: [1,2,2,3,5,6]

 https://leetcode.com/problems/merge-sorted-array/
 */
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var merge = [Int]()
    var i = 0, j = 0
    while i < m && j < n {
        if nums1[i] >= nums2[j] {
            merge.append(nums2[j])
            j += 1
        } else {
            merge.append(nums1[i])
            i += 1
        }
    }

    while j < n {
        merge.append(nums2[j])
        j += 1
    }

    while i < m {
        merge.append(nums1[i])
        i += 1
    }

    nums1 = merge
}
