/*
353. Design Snake Game
Design a Snake game that is played on a device with screen size = width x height. Play the game online if you are not familiar with the game.

The snake is initially positioned at the top left corner (0,0) with length = 1 unit.

You are given a list of food's positions in row-column order. When a snake eats the food, its length and the game's score both increase by 1.

Each food appears one by one on the screen. For example, the second food will not appear until the first food was eaten by the snake.

When a food does appear on the screen, it is guaranteed that it will not appear on a block occupied by the snake.

Example:

Given width = 3, height = 2, and food = [[1,2],[0,1]].

Snake snake = new Snake(width, height, food);

Initially the snake appears at position (0,0) and the food at (1,2).

|S| | |
| | |F|

snake.move("R"); -> Returns 0

| |S| |
| | |F|

snake.move("D"); -> Returns 0

| | | |
| |S|F|

snake.move("R"); -> Returns 1 (Snake eats the first food and right after that, the second food appears at (0,1) )

| |F| |
| |S|S|

snake.move("U"); -> Returns 1

| |F|S|
| | |S|

snake.move("L"); -> Returns 2 (Snake eats the second food)

| |S|S|
| | |S|

snake.move("U"); -> Returns -1 (Game over because snake collides with border)

https://leetcode.com/problems/design-snake-game/
*/

class SnakeGame {

    /** Initialize your data structure here.
        @param width - screen width
        @param height - screen height 
        @param food - A list of food positions
        E.g food = [[1,1], [1,0]] means the first food is positioned at [1,1], the second is at [1,0]. */
    let width: Int
    let height: Int
    var food: [[Int]]
    var snake = [[0,0]]// [[row, col]]
    var score = 0
    init(_ width: Int, _ height: Int, _ food: [[Int]]) {
        self.width = width
        self.height = height
        self.food = food
    }
    
    /** Moves the snake.
        @param direction - 'U' = Up, 'L' = Left, 'R' = Right, 'D' = Down 
        @return The game's score after the move. Return -1 if game over. 
        Game over when snake crosses the screen boundary or bites its body. */
    func move(_ direction: String) -> Int {
        var current = snake[0]
        let last = snake.removeLast()
        let next: [Int] // [row, col]
        if direction == "U" {
            next = [current[0]-1, current[1]]
        } else if direction == "L" {
            next = [current[0], current[1]-1]
        } else if direction == "R" {
            next = [current[0], current[1]+1]
        } else { // down
            next = [current[0]+1, current[1]]
        }
      
        // crosses the scrren boundary or bites its body
        if next[0] < 0 || 
        next[0] >= height ||
        next[1] >= width || 
        next[1] < 0 || 
        snake.contains(next) {
            return -1
        } else if let f = food.first, f == next { // eat food
            snake.insert(next, at: 0)
            snake.append(last)
            food.removeFirst()
            score += 1
            return score
        } else { // just move
            snake.insert(next, at:0)
            return score
        }
    }
}

/**
 * Your SnakeGame object will be instantiated and called as such:
 * let obj = SnakeGame(width, height, food)
 * let ret_1: Int = obj.move(direction)
 */