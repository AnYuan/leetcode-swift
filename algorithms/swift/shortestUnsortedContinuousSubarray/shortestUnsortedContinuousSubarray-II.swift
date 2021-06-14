class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        let n = nums.count
        // find left and right bound
        var left = n
        var right = 0
        var monoStack = [Int]()
        // find left
        for i in 0..<nums.count {
            while !monoStack.isEmpty, nums[i] < nums[monoStack.last!] {
                left = min(left, monoStack.removeLast())
            }
            monoStack.append(i)
        }

        // find right
        monoStack.removeAll()

        for i in (0..<nums.count).reversed() {
            while !monoStack.isEmpty, nums[i] > nums[monoStack.last!] {
                right = max(right, monoStack.removeLast())
            }
            monoStack.append(i)
        }
        return right - left > 0 ? right - left + 1 : 0
    }
}
