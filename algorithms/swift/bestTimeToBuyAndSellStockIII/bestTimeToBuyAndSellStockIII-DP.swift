func maxProfit(_ prices: [Int]) -> Int {

    guard prices.count > 0 else { return 0 }

    var profit = Array(repeating:Array(repeating: Array(repeating: 0, count: 2), count: 3), count: prices.count)

    //i: ith day profit
    //k: how many times we do the transaction (buy-sell)
    //j: do we have bought stock? 1: YES 0: NO

    let minus = -9999

    profit[0][0][0] = 0
    profit[0][0][1] = -prices[0]
    profit[0][1][0] = minus
    profit[0][1][1] = minus
    profit[0][2][0] = minus
    profit[0][2][1] = minus

    for i in 1..<prices.count {
        //ith day
        //0 transaction, we do nothing
        profit[i][0][0] = profit[i-1][0][0]
        //0 transaction, we buy
        profit[i][0][1] = max(profit[i-1][0][0] - prices[i], profit[i-1][0][1])

        //1 transaction
        // sell
        profit[i][1][0] = max(profit[i-1][1][0], profit[i-1][0][1] + prices[i])
        // buy
        profit[i][1][1] = max(profit[i-1][1][1], profit[i-1][1][0] - prices[i])

        // 2 transactions
        profit[i][2][0] = max(profit[i-1][2][0], profit[i-1][1][1] + prices[i])
    }
    let n = prices.count - 1
    return max(profit[n][0][0], profit[n][1][0], profit[n][2][0])
}
