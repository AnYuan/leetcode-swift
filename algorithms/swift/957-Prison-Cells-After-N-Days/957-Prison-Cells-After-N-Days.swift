/*
957. Prison Cells After N Days

here are 8 prison cells in a row, and each cell is either occupied or vacant.

Each day, whether the cell is occupied or vacant changes according to the following rules:

    If a cell has two adjacent neighbors that are both occupied or both vacant, then the cell becomes occupied.
    Otherwise, it becomes vacant.

(Note that because the prison is a row, the first and the last cells in the row can't have two adjacent neighbors.)

We describe the current state of the prison in the following way: cells[i] == 1 if the i-th cell is occupied, else cells[i] == 0.

Given the initial state of the prison, return the state of the prison after N days (and N such changes described above.)

 

Example 1:

Input: cells = [0,1,0,1,1,0,0,1], N = 7
Output: [0,0,1,1,0,0,0,0]
Explanation: 
The following table summarizes the state of the prison on each day:
Day 0: [0, 1, 0, 1, 1, 0, 0, 1]
Day 1: [0, 1, 1, 0, 0, 0, 0, 0]
Day 2: [0, 0, 0, 0, 1, 1, 1, 0]
Day 3: [0, 1, 1, 0, 0, 1, 0, 0]
Day 4: [0, 0, 0, 0, 0, 1, 0, 0]
Day 5: [0, 1, 1, 1, 0, 1, 0, 0]
Day 6: [0, 0, 1, 0, 1, 1, 0, 0]
Day 7: [0, 0, 1, 1, 0, 0, 0, 0]

Example 2:

Input: cells = [1,0,0,1,0,0,1,0], N = 1000000000
Output: [0,0,1,1,1,1,1,0]

 

Note:

    cells.length == 8
    cells[i] is in {0, 1}
    1 <= N <= 10^9

https://leetcode.com/problems/prison-cells-after-n-days/
https://leetcode.com/problems/prison-cells-after-n-days/discuss/205684/JavaPython-Find-the-Loop-or-Mod-14
*/
class Solution {
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        if cells.count < 2 || N == 0 { return cells }
    
        var cells = cells
        // 1.every 14 days will become a loop, which has same state, thats why we use mod 14 here
        // 2.due to we start from day 0(first day), we need N-1 here; after get reminder, + 1 for resume the days
        let N = (N-1) % 14 + 1 
        for _ in 0..<N { update(&cells) }
        return cells
    }
    
    func update(_ cells: inout [Int]) {
        var dummy = cells
        for i in 0..<cells.count {
            if i == 0 || i == cells.count-1 { 
                cells[i] = 0 
                continue
            }
            if dummy[i-1] == dummy[i+1] { 
                cells[i] = 1 
            } else {
                cells[i] = 0
            }
        } 
    } 
}