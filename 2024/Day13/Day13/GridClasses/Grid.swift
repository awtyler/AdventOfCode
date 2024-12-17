//
//  Grid.swift
//  Day4
//
//  Created by Aaron Tyler on 12/4/24.
//

import Foundation

protocol GridProtocol: AnyObject {
    associatedtype GridSpaceType: GridSpaceProtocol
    
    var allSpaces: [GridSpaceType] { get set }
    var spaces: [[GridSpaceType]] { get set }
    var xMax: Int { get set }
    var yMax: Int { get set }
    var xCount: Int { get set }
    var yCount: Int { get set }

    init()
    init(mapString: String)

    func spaceAt(x: Int, y: Int) -> GridSpaceType
    func spaceAt(coords: Coordinates?) -> GridSpaceType?
    func getNeighborCoords(forSpace space: GridSpaceType, direction: Direction?) -> (Int, Int)?
    func getNeighbor(forSpace: GridSpaceType, direction: Direction, distance: Int) -> GridSpaceType?
    func getNeighbor(fromStart start: GridSpaceType, direction: Direction, count: Int, startPosition: Int) -> [GridSpaceType]
    func printGrid()
}
    
extension GridProtocol {
    init(mapString: String) {
        self.init()
        
        let lines = mapString.linesToStringArray()
        var buildSpaces: [[GridSpaceType]] = []
        allSpaces = []
        
        for line in lines {
            let space = line.charactersToStringArray().map { GridSpaceType($0) }
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
    
    func spaceAt(x: Int, y: Int) -> GridSpaceType {
        return spaces[y][x]
    }
    
    func spaceAt(coords: Coordinates?) -> GridSpaceType? {
        guard let coords else { return nil }
        return spaceAt(x: coords.0, y: coords.1)
    }
    
    func getNeighborCoords(forSpace space: GridSpaceType, direction: Direction?) -> (Int, Int)? {
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
    
    func getNeighbor(forSpace: GridSpaceType, direction: Direction, distance: Int = 1) -> GridSpaceType? {
        var space: GridSpaceType? = forSpace
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
    
    func getNeighbor(fromStart start: GridSpaceType, direction: Direction, count: Int, startPosition: Int = 0) -> [GridSpaceType] {
        var spaces = [GridSpaceType]()
        
        var cur: GridSpaceType? = getNeighbor(forSpace: start, direction: direction.opposite, distance: startPosition)
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

class Grid: GridProtocol {
    typealias GridSpaceType = GridSpace

    var allSpaces: [GridSpace] = []
    var spaces: [[GridSpace]] = []
    var xMax: Int = 0
    var yMax: Int = 0
    var xCount: Int = 0
    var yCount: Int = 0
    
    required init() {
        allSpaces = []
        spaces = []
        xMax = 0
        yMax = 0
        xCount = 0
        yCount = 0
    }
}
