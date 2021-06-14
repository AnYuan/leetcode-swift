var memo = [Int: Int]() // total : ways

func climbStairs(_ n: Int) -> Int {

    guard n > 2 else { return n }

    memo[1] = 1
    memo[2] = 2

    return _helper(n-1) + _helper(n-2)
}

func _helper(_ n: Int) -> Int {
    if let v = memo[n] { return v }
    memo[n] = _helper(n-1) + _helper(n-2)
    return memo[n]!
}
