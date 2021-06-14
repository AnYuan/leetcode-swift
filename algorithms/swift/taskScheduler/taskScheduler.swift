/*
 Given a char array representing tasks CPU need to do. It contains capital letters A to Z where different letters represent different tasks. Tasks could be done without original order. Each task could be done in one interval. For each interval, CPU could finish one task or just be idle.

 However, there is a non-negative cooling interval n that means between two same tasks, there must be at least n intervals that CPU are doing different tasks or just be idle.

 You need to return the least number of intervals the CPU will take to finish all the given tasks.

 Example:

 Input: tasks = ["A","A","A","B","B","B"], n = 2
 Output: 8
 Explanation: A -> B -> idle -> A -> B -> idle -> A -> B.

 Note:

 1.The number of tasks is in the range [1, 10000].
 2.The integer n is in the range [0, 100].
 */
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    guard !tasks.isEmpty else {
        return 0
    }

    var countOfTasks = Array(repeating: 0, count: 26)
    let offset = "A".utf8.first!
    let taskStr = String(tasks)
    for task in taskStr.utf8 {
        let count = Int(task - offset)
        countOfTasks[count] += 1
    }

    var mostFrequency = 0
    var numOfMostFrequency = 0
    for count in countOfTasks {
        if count == mostFrequency {
            numOfMostFrequency += 1
        } else if count > mostFrequency {
            mostFrequency = count
            numOfMostFrequency = 1
        }
    }

    return max((n+1) * (mostFrequency-1) + numOfMostFrequency, tasks.count)
}
