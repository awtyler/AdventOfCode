//
//  Grid.swift
//  Day4
//
//  Created by Aaron Tyler on 12/4/24.
//

import Foundation

class Grid {
    private(set) var allSpaces: [GridSpace]
    private(set) var spaces: [[GridSpace]]
    
    let xMax: Int
    let yMax: Int
    
    let xCount: Int
    let yCount: Int
    
    required init(mapString: String) {
        let lines = mapString.linesToStringArray()
        var buildSpaces: [[GridSpace]] = []
        allSpaces = []
        
        for line in lines {
            let space = line.charactersToStringArray().map { GridSpace($0) }
            buildSpaces.append(space)
            allSpaces.append(contentsOf: space)
        }
        
        spaces = buildSpaces
        
        xCount = spaces[0].count
        xMax = xCount - 1
        yCount = spaces.count
        yMax = yCount - 1

        for x in 0...xMax {
            for y in 0...yMax {
                spaces[y][x].x = x
                spaces[y][x].y = y
            }
        }
    }
    
    func spaceAt(x: Int, y: Int) -> GridSpace {
        return spaces[y][x]
    }
    
    func spaceAt(coords: Coordinates?) -> GridSpace? {
        guard let coords else { return nil }
        return spaceAt(x: coords.0, y: coords.1)
    }
    
    func getNeighborCoords(forSpace space: GridSpace, direction: Direction?) -> (Int, Int)? {
        guard let direction else { return nil }
        
        var coords: Coordinates
        
        switch(direction) {
        case .north: coords = (space.x, space.y - 1)
        case .south: coords = (space.x, space.y + 1)
        case .east: coords = (space.x + 1, space.y)
        case .west: coords = (space.x - 1, space.y)
        case .northWest: coords = (space.x - 1, space.y - 1)
        case .northEast: coords = (space.x + 1, space.y - 1)
        case .southWest: coords = (space.x - 1, space.y + 1)
        case .southEast: coords = (space.x + 1, space.y + 1)
        }
        
        if coords.x < 0 || coords.x > xMax {
            return nil
        }
        
        if coords.y < 0 || coords.y > yMax {
            return nil
        }
        return coords
    }
    
    func getNeighbor(forSpace: GridSpace, direction: Direction, distance: Int = 1) -> GridSpace? {
        var space: GridSpace? = forSpace
        distance.times {
            if space != nil {
                let coords = getNeighborCoords(forSpace: space!, direction: direction)
                space = spaceAt(coords: coords)
            } else {
                return
            }
        }
        return space
    }
    
    func getNeighbor(fromStart start: GridSpace, direction: Direction, count: Int, startPosition: Int = 0) -> [GridSpace] {
        var spaces = [GridSpace]()
        
        var cur: GridSpace? = getNeighbor(forSpace: start, direction: direction.opposite, distance: startPosition)
        (count).times {
            if cur != nil {
                spaces.append(cur!)
                cur = getNeighbor(forSpace: cur!, direction: direction)
            }
        }
        return spaces
    }

    func printGrid() {
        print("+" + ("-" * xMax) + "-+")
        
        for y in 0...yMax {
            print("|", terminator: "")
            for x in 0...xMax {
                let space = spaceAt(x: x, y: y)
                var char = space.id

                print(char, terminator: "")
            }
            print("|", terminator: "")
            print("   ")
        }
        print("+" + ("-" * xMax) + "-+")

        
    }
}
