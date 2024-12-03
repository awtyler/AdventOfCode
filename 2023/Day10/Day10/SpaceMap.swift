//
//  SpaceMap.swift
//  Day10
//
//  Created by Aaron Tyler on 12/2/24.
//

import Foundation

class SpaceMap {
    private(set) var spaces: [[Space]]
    
    private(set) var loopSpaces: [Space] = []
    
    private(set) var start: Space!
    let xMax: Int
    let yMax: Int
    
    init(mapString: String) {
        let lines = mapString.linesToStringArray()
        var buildSpaces: [[Space]] = []
        
        for line in lines {
            buildSpaces.append(line.charactersToStringArray().map { Space($0) })
        }
        
        spaces = buildSpaces
        
        xMax = spaces[0].count - 1
        yMax = spaces.count - 1

        for x in 0...xMax {
            for y in 0...yMax {
                spaces[y][x].x = x
                spaces[y][x].y = y
                if spaces[y][x].isStartSpace {
                    start = spaces[y][x]
                }
            }
        }
        start = start ?? spaces[0][0]    // This shouldn't be necessary. There should always be an `S` space
        
        let N = spaceAt(coords: start.getNeighborCoords(.north, xMax: xMax, yMax: yMax))
        let S = spaceAt(coords: start.getNeighborCoords(.south, xMax: xMax, yMax: yMax))
        let E = spaceAt(coords: start.getNeighborCoords(.east, xMax: xMax, yMax: yMax))
        let W = spaceAt(coords: start.getNeighborCoords(.west, xMax: xMax, yMax: yMax))
        
        start.shape = start.inferShape(north: N, south: S, east: E, west: W)
        let startExits = start.shape.exits
        start.exit1 = startExits.0
        start.exit2 = startExits.1
    }
    
    func spaceAt(x: Int, y: Int) -> Space {
        return spaces[y][x]
    }
    
    func spaceAt(coords: (Int, Int)?) -> Space? {
        guard let coords else { return nil }
        return spaceAt(x: coords.0, y: coords.1)
    }
    
    func findNext(from: Space?, entrance: Exit?) -> (Space?, Exit?) {
        guard let from, let entrance else { return (nil, nil) }
        var target: Exit?
        if from.exit1 == entrance {
            target = from.exit2
        } else if from.exit2 == entrance {
            target = from.exit1
        }
//        print("FINDNEXT: ", from.x, from.y, entrance, target)
        guard let nextCoords = from.getNeighborCoords(target, xMax: xMax, yMax: yMax) else { return (nil, nil) }
        
        return (spaceAt(coords: nextCoords), from.getOtherExit(knownExit: entrance))
    }
    
    @discardableResult
    func findMaxNum() -> Int? {
        var count = 1

//        print("START: \(start.x),\(start.y) / \(start.shape)")
        
        var prevExit1 = start.exit1
        var prevExit2 = start.exit2
        
        var route1Space = spaceAt(coords: start.getNeighborCoords(start.exit1, xMax: xMax, yMax: yMax))
        var route2Space = spaceAt(coords: start.getNeighborCoords(start.exit2, xMax: xMax, yMax: yMax))
        
        /*

         ..F7.
         .FJ|.
         SJ.L7
         |F--J
         LJ...

         */
        
        var done = false
        while !done {
//            print("Count/R1/R2: \(count)    \(route1Space!.x),\(route1Space!.y),\(route1Space!.id)     ::      \(route2Space!.x),\(route2Space!.y),\(route2Space!.id)")
            
            // Move both sides to the next space in the route
            (route1Space, prevExit1) = findNext(from: route1Space, entrance: prevExit1?.opposite)
            (route2Space, prevExit2) = findNext(from: route2Space, entrance: prevExit2?.opposite)

            guard let route1Space, let route2Space else {
//                print("GUARD: ", route1Space, route2Space)
                return nil
            }

            loopSpaces.append(route1Space)
            loopSpaces.append(route2Space)

            count += 1
            
            if route1Space == route2Space {
                done = true
            }
        }
        
        return count
    }
}
