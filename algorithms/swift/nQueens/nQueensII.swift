func solveNQueens(_ n: Int) -> [[String]] {

    var result = [[Int]]()

    func DFS(queens: [Int], xyDiff: [Int],  xySum: [Int]) {
        let p = queens.count
        if p == n {
            result.append(queens)
            return
        }

        for q in 0..<n {
            if !queens.contains(q) &&
                !xyDiff.contains(p-q) &&
                !xySum.contains(p+q) {

                var tQ = queens
                tQ.append(q)
                var tDiff = xyDiff
                tDiff.append(p-q)
                var tSum = xySum
                tSum.append(p+q)

                DFS(queens: tQ, xyDiff: tDiff, xySum: tSum)
            }
        }
    }

    func helper(_ result: [[Int]]) -> [[String]] {
        var str = [[String]]()
        for sol in result {
            var strSol = [String]()
            for i in sol {
                var s = String(repeating: ".", count: i)
                s.append("Q")
                let ss = String(repeating: ".", count: n-i-1)
                s.append(ss)
                strSol.append(s)
            }
            str.append(strSol)
        }
        return str
    }

    DFS(queens:[Int](), xyDiff:[Int](), xySum: [Int]())

    return helper(result)
}
