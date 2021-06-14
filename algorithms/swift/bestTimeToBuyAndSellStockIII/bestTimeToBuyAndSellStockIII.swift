/*
 Say you have an array for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete at most two transactions.

 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

 Example 1:
 Input: [3,3,5,0,0,3,1,4]
 Output: 6
 Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
 Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.

 Example 2:

 Input: [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
 engaging multiple transactions at the same time. You must sell before buying again.

 Example 3:

 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.

 */

func maxProfit(_ prices: [Int]) -> Int {

    let n = prices.count
    guard n > 1 else { return 0 }

    var buy = [Int]()
    var copy = prices
    copy.insert(Int.max, at: 0)
    let nn = copy.count
    for i in 1..<nn-1 {
        if copy[i] <= copy[i-1] && copy[i+1] > copy[i] {
            //buy point
            buy.append(i)
        }
    }

    buy.insert(0, at: 0)
    var result = 0

    for i in 0..<buy.count where i + 1 < buy.count {
        if i == 0 {
            let p1 = _maxProfit(copy)
            if p1 > result { result = p1 }
        } else {
            let a = copy[1..<buy[i+1]]
            let b = copy[buy[i+1]..<copy.count]

            let p0 = _maxProfit(Array(a))
            let p1 = _maxProfit(Array(b))

            let t = p0+p1
            if t > result { result = t }

        }
    }
    return result
}

func _maxProfit(_ prices: [Int]) -> Int {

    guard prices.count > 1 else { return 0 }
    if prices.count == 2 {
        if prices[0] - prices[1] < 0 { return prices[1] - prices[0] }
        else { return 0 }
    }

    var currentLowest = prices[0]
    var profit = 0

    for i in 0..<prices.count {
        if prices[i] < currentLowest {
            currentLowest = prices[i]
        } else {
            let diff = prices[i] - currentLowest
            if diff > profit { profit = diff }
        }
    }
    return profit
}
