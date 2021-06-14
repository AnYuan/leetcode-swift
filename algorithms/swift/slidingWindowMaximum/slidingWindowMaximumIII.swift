func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

    guard nums.count > 1 && k > 1 else { return nums }

    var result = [Int]()
    var window = [Int]() // index
    for (i, x) in nums.enumerated() {

        // after this guard
        // , we can safely first! and last!
        guard window.count > 0 else {
            window.append(i)
            continue
        }

        // after init first window,
        // current max index is out of date
        // so remove it from first
        if i >= k && window.first! <= i - k {
            window.removeFirst()
        }

        // delete all elements which are smaller than
        // or equal to x, so window.last! is 2th big
        // after
        while window.count > 0 &&
            nums[window.last!] <= x {
                window.removeLast()
        }

        window.append(i)

        if i >= k - 1 {
            result.append(nums[window.first!])
        }
    }

    return result
}

