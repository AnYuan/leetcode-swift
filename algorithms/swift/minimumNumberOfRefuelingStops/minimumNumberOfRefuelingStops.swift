/*
 A car travels from a starting position to a destination which is target miles east of the starting position.

 Along the way, there are gas stations.  Each station[i] represents a gas station that is station[i][0] miles east of the starting position, and has station[i][1] liters of gas.

 The car starts with an infinite tank of gas, which initially has startFuel liters of fuel in it.  It uses 1 liter of gas per 1 mile that it drives.

 When the car reaches a gas station, it may stop and refuel, transferring all the gas from the station into the car.

 What is the least number of refueling stops the car must make in order to reach its destination?  If it cannot reach the destination, return -1.

 Note that if the car reaches a gas station with 0 fuel left, the car can still refuel there.  If the car reaches the destination with 0 fuel left, it is still considered to have arrived.

 Example 1:

 Input: target = 1, startFuel = 1, stations = []
 Output: 0
 Explanation: We can reach the target without refueling.

 Example 2:

 Input: target = 100, startFuel = 1, stations = [[10,100]]
 Output: -1
 Explanation: We can't reach the target (or even the first gas station).

 Example 3:

 Input: target = 100, startFuel = 10, stations = [[10,60],[20,30],[30,30],[60,40]]
 Output: 2
 Explanation: 
 We start with 10 liters of fuel.
 We drive to position 10, expending 10 liters of fuel.  We refuel from 0 liters to 60 liters of gas.
 Then, we drive from position 10 to position 60 (expending 50 liters of fuel),
 and refuel from 10 liters to 50 liters of gas.  We then drive to and reach the target.
 We made 2 refueling stops along the way, so we return 2.

 Note:

1. 1 <= target, startFuel, stations[i][1] <= 10^9
2. 0 <= stations.length <= 500
3. 0 < stations[0][0] < stations[1][0] < ... < stations[stations.length-1][0] < target
*/


func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
    let fuelRatio = 1 // Number of liters per mile

    if startFuel >= target {
        return 0
    }

    var reachableDistancesPerStops = [Int](repeating: 0, count: stations.count + 1)
    // distance we can reach with 0 stops
    reachableDistancesPerStops[0] = startFuel / fuelRatio

    // initialize with unreachable number of stops
    var minimumNumberOfStops = stations.count + 1

    for stationIdx in 0..<stations.count {
        reverseLoop: for numberOfStops in (0...stationIdx).lazy.reversed() {
            // check if this station is reachable by `i` stops
            let isReachable = reachableDistancesPerStops[numberOfStops] >= stations[stationIdx][0]

            guard isReachable else {
                // if this station is not reachble by i stops then it can't be reached by any numberOfStops < i
                break reverseLoop
            }

            let maximumDistance = reachableDistancesPerStops[numberOfStops] + stations[stationIdx][1] / fuelRatio
            reachableDistancesPerStops[numberOfStops + 1] = max(reachableDistancesPerStops[numberOfStops + 1], maximumDistance)

            if reachableDistancesPerStops[numberOfStops + 1] >= target {
                minimumNumberOfStops = min(minimumNumberOfStops, numberOfStops + 1)
            }
        }
    }

    // minimumNumberOfStops changed during the loop, then target is reachable
    if minimumNumberOfStops <= stations.count {
        return minimumNumberOfStops
    } else {
        // target is unreachable
        return -1
    }
}

