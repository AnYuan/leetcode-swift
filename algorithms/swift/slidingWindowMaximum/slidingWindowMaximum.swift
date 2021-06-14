/*
 Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position. Return the max sliding window.

 https://leetcode.com/problems/sliding-window-maximum/
 */

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

    struct Position {
        let value: Int
        let index: Int
    }

    // Using deque to maintain maximum
    var window: [Position] = [Position]()
    var result: [Int] = [Int]()

    for i in 0..<nums.count {
        //find bigger num
        while let last = window.last, last.value < nums[i] {
            // remove previous smaller nums
            window.removeLast()
        }
        // insert to window
        window.append(Position(value: nums[i], index: i))

        // first num will go out of current window
        if let first = window.first, first.index + k == i {
            window.removeFirst()
        }

        // update result
        if i >= k-1 {
            result.append(window.first!.value)
        }
    }
    return result
}
