/*
743. Network Delay Time
There are N network nodes, labelled 1 to N.

Given times, a list of travel times as directed edges times[i] = (u, v, w), where u is the source node, v is the target node, and w is the time it takes for a signal to travel from source to target.

Now, we send a signal from a certain node K. How long will it take for all nodes to receive the signal? If it is impossible, return -1.

Input: times = [[2,1,1],[2,3,1],[3,4,1]], N = 4, K = 2
Output: 2

Note:

1.N will be in the range [1, 100].
2.K will be in the range [1, N].
3.The length of times will be in the range [1, 6000].
4.All edges times[i] = (u, v, w) will have 1 <= u, v <= N and 0 <= w <= 100.
*/

func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {

    var dist = Array(repeating: Int.max, count: N+1)
    dist[K] = 0

    for _ in 0..<N {
        for edge in times {
            let u = edge[0]
            let v = edge[1]
            let w = edge[2]

            if dist[u] != Int.max && dist[v] > dist[u] + w {
                dist[v] = dist[u] + w
            }
        }
    }

    var result = 0
    for i in 1...N {
        result = max(result, dist[i])
    }
    return result == Int.max ? -1 : result
}
