/*
 Write a program to solve a Sudoku puzzle by filling the empty cells.

 A sudoku solution must satisfy all of the following rules:

 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 Empty cells are indicated by the character '.'.

 Note:

 The given board contain only digits 1-9 and the character '.'.
 You may assume that the given Sudoku puzzle will have a single unique solution.
 The given board size is always 9x9.

 https://leetcode.com/problems/sudoku-solver/
 */

struct Point {
    let x: Int
    let y: Int
    var vals: Set<Character>
}


func solveSudoku(_ board: inout [[Character]]) {

    let n = board.count
    var todo = [Point]()

    // construct todo
    for i in 0..<n {
        for j in 0..<n {
            if board[i][j] == "." {
                let sols = solutions(i, j, board)
                todo.append(sols)
            }
        }
    }

    todo.sort { $0.vals.count < $1.vals.count }

    func checkValid(_ board: [[Character]], _ row: Int, _ col: Int, val: Character) -> Bool {
        for i in 0..<n {
            if ((i != col && board[row][i] == val) ||
                (i != row && board[i][col] == val)) {
                return false
            }
        }

        //3x3
        let rm = row/3
        let cm = col/3

        let rlb = rm*3
        let rub = rm*3 + 3

        let clb = cm * 3
        let cub = cm*3 + 3

        for i in rlb..<rub {
            for j in clb..<cub {
                if i == row && j == col { continue }
                let c = board[i][j]
                if c == val {
                    return false
                }
            }
        }
        return true
    }

    func dfs(_ b: [[Character]], _ todo: [Point]) {

        guard todo.count > 0 else {
            board = b
            return
        }
        var copyToDo = todo
        var copyBoard = b
        var point = copyToDo.removeFirst()

        guard board[point.x][point.y] == "." else { return }

        for v in point.vals {
            if checkValid(copyBoard, point.x, point.y, val: v) {
                copyBoard[point.x][point.y] = v
                dfs(copyBoard, copyToDo)
            }
        }
    }

    var copy = todo
    for p in todo {
        if p.vals.count == 1 {
            copy.removeFirst()
            board[p.x][p.y] = p.vals.first!
        } else {
            //run
            dfs(board, copy)
        }
    }
}

func solutions(_ row: Int, _ col: Int, _ board: [[Character]]) -> Point {
    var sol:Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let n = board.count
    //row
    for j in 0..<n {
        let c = board[row][j]
        if c != "." {
            sol.remove(c)
        }
    }
    //col
    for i in 0..<n {
        let c = board[i][col]
        if c != "." {
            sol.remove(c)
        }
    }
    //3x3
    let rm = row/3
    let cm = col/3

    let rlb = rm*3
    let rub = rm*3 + 3

    let clb = cm * 3
    let cub = cm*3 + 3
    for i in rlb..<rub {
        for j in clb..<cub {
            let c = board[i][j]
            if c != "." {
                sol.remove(c)
            }
        }
    }
    return Point(x: row, y: col, vals: sol)
}
