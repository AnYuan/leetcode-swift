func mySqrt(_ x: Int) -> Int {
    var r = x
    while r * r > x {
        r = (r + x / r) / 2
    }
    return r
}
