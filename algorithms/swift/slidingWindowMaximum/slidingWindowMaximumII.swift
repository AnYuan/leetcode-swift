func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

    guard nums.count > 1 && k > 1 else { return nums }

    var result = [Int]()
    var maxIndex = 0

    // init current window maxIndex
    for i in 0..<k {
        if nums[i] >= nums[maxIndex] {
            maxIndex = i
        }
    }
    result.append(nums[maxIndex])
    for j in k..<nums.count {
        //update maxIndex
        if nums[j] >= nums[maxIndex] {
            maxIndex = j
        } else {
            // maxIndex is not in current window
            if maxIndex < (j - k + 1) {
                var tmpMaxIndex = j - k + 1
                //find new max
                for i in (j - k + 2)...j {
                    if nums[i] >= nums[tmpMaxIndex] {
                        tmpMaxIndex = i
                    }
                }
                maxIndex = tmpMaxIndex
            }
        }
        result.append(nums[maxIndex])
    }

    return result
}
