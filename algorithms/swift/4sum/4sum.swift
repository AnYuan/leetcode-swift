/*
 18. 4Sum
 Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

 Note:

 The solution set must not contain duplicate quadruplets.

 Example:

 Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.

 A solution set is:
 [
 [-1,  0, 0, 1],
 [-2, -1, 1, 2],
 [-2,  0, 0, 2]
 ]

 https://leetcode.com/problems/4sum/
 */

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sorted = nums.sorted()
        var res = Array<[Int]>()
        if nums.count < 4{
            return res
        }

        for i in 0...sorted.count-4{
            //cutting branch
            if i>0 && sorted[i]==sorted[i-1]{continue}
            for j in i+1...sorted.count-3{
                //cutting branch
                if j>i+1 && sorted[j]==sorted[j-1]{continue}
                var left = j+1
                var right = sorted.count-1

                while left < right{
                    let sum = sorted[i]+sorted[j]+sorted[left]+sorted[right]
                    if sum == target{
                        res.append([sorted[i],sorted[j],sorted[left],sorted[right]])
                         right -= 1;
                        left += 1;
                         while sorted[right] == sorted[right+1] && left < right
                             { right -= 1 ;}
                        while sorted[left] == sorted[left-1] && left < right
                             { left += 1 ;}
                    }
                    else if sum > target {
                        right -= 1
                    }
                    else {
                        left += 1
                    }
                } 
            }
        }
        return res
    }
}
