/*
 969. Pancake Sorting

 Given an array A, we can perform a pancake flip: We choose some positive integer k <= A.length, then reverse the order of the first k elements of A.  We want to perform zero or more pancake flips (doing them one after another in succession) to sort the array A.

 Return the k-values corresponding to a sequence of pancake flips that sort A.  Any valid answer that sorts the array within 10 * A.length flips will be judged as correct.

 Example 1:

 Input: [3,2,4,1]
 Output: [4,2,4,3]
 Explanation: 
 We perform 4 pancake flips, with k values 4, 2, 4, and 3.
 Starting state: A = [3, 2, 4, 1]
 After 1st flip (k=4): A = [1, 4, 2, 3]
 After 2nd flip (k=2): A = [4, 1, 2, 3]
 After 3rd flip (k=4): A = [3, 2, 1, 4]
 After 4th flip (k=3): A = [1, 2, 3, 4], which is sorted. 


 Example 2:

 Input: [1,2,3]
 Output: []
 Explanation: The input is already sorted, so there is no need to flip anything.
 Note that other answers, such as [3, 3], would also be accepted.
 */
class Solution {
    func pancakeSort(_ A: [Int]) -> [Int] {
        var largest = A.count
        var todo = A
        var res = [Int]()

        while largest > 1 {
            let index = max(largest, todo)
            flip(&todo, index)
            flip(&todo, largest - 1)
            res.append(index + 1)
            res.append(largest)
            largest -= 1
        }
        return res
    }

    func max(_ target: Int, _ nums: [Int]) -> Int {
        for i in 0 ..< nums.count {
            if target == nums[i] {return i}
        }
        return -1
    }
    func flip(_ nums: inout [Int], _ index: Int) {
        var left = 0, right = index
        while left < right {
            (nums[left], nums[right]) = (nums[right], nums[left])
            left += 1
            right -= 1
        }
    }
}
