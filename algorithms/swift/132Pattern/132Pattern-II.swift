func find132pattern(_ nums: [Int]) -> Bool {

    var stack = [(Int, Int)]() // (min, max)

    for i in 0..<nums.count {
        // init stack, push nums[i] as min and max value
        // or nums[i] is less than min of peek on stack, insert new range.
        if stack.isEmpty || nums[i] < stack.last!.0 {
            stack.append((nums[i], nums[i]))
        } else {
            let currentMin = stack.last!.0
            // if we nums[i] is greater or equal to peek max,
            // then we pop peek element on stack
            while !stack.isEmpty && nums[i] >= stack.last!.1 {
                stack.removeLast()
            }
            // find 132 pattern
            if !stack.isEmpty && nums[i] > stack.last!.0
                 && nums[i] < stack.last!.1 {
                return true
            }
            // update peek on stack
            // 0. update max or
            // 1. insert new range which min value is less than peek's min value on stack
            stack.append((currentMin, nums[i]))
        }
    }
    return false
}
