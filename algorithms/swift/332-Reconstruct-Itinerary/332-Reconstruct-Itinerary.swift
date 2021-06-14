/*
332. Reconstruct Itinerary

Given a list of airline tickets represented by pairs of departure and arrival airports [from, to], reconstruct the itinerary in order. All of the tickets belong to a man who departs from JFK. Thus, the itinerary must begin with JFK.

Note:

    If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string. For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
    All airports are represented by three capital letters (IATA code).
    You may assume all tickets form at least one valid itinerary.
    One must use all the tickets once and only once.

Example 1:

Input: [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
Output: ["JFK", "MUC", "LHR", "SFO", "SJC"]

Example 2:

Input: [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"].
             But it is larger in lexical order.

https://leetcode.com/problems/reconstruct-itinerary/
*/
class Solution {
            
    var dict = [String: [String]]()
    var result = [String]()
    
    func findItinerary(_ tickets: [[String]]) -> [String] {
        // init graph
        for t in tickets {
            let from = t[0]
            let dest = t[1]
            dict[from, default: [String]()].append(dest)
        }
        
        for k in dict.keys {
            let dests = dict[k]!
            // sort by lexical order
            dict[k] = dests.sorted()
        }
        dfs("JFK")
        return result
    }
    
    func dfs(_ from: String) {

        /*
        [["JFK","KUL"],["JFK","NRT"],["NRT","JFK"]]
        JFK: KUL, NRT
        NRT: JFK
        result: 
        ["KUL"]
        ["JFK", "KUL"]
        ["NRT", "JFK", "KUL"]
        ["JFK", "NRT", "JFK", "KUL"]
        */
        while var dests = dict[from], dests.count > 0 {
            let next = dests.removeFirst()
            dict[from] = dests
            dfs(next)
        }        
        result.insert(from, at:0)
    }
}