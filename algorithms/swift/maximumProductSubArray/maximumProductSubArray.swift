/*
 Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.

 Example 1:
 Input: [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.

 Example 2:
 Input: [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.

 https://leetcode.com/problems/maximum-product-subarray/
 */

func maxProduct(_ nums: [Int]) -> Int {

    guard nums.count > 0 else { return 0 }

    var memo = [[Int]]()
    let n = nums.count

    memo.append([nums[n-1]])
    var max = nums[n-1]

    for i in (0..<n-1).reversed() {
        let current = nums[i]
        if current > max { max = current }
        var temp = [current]

        if current == 1 { continue }

        for v in memo.last! {
            let mul = current * v
            if mul > max { max = mul }
            temp.append(current * v)
        }

        memo.append(temp)
    }

    return max
}
