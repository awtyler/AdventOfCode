//
//  GridSpace.swift
//  Day4
//
//  Created by Aaron Tyler on 12/4/24.
//

import Foundation

typealias Coordinates = (x: Int, y: Int)

enum Direction: Int, CaseIterable {
    case north = 0
    case northEast
    case east
    case southEast
    case south
    case southWest
    case west
    case northWest
    
    var opposite: Direction {
        switch self {
            
        case .north: return .south
        case .south: return .north
        case .east: return .west
        case .west: return .east
        case .northWest: return .southEast
        case .northEast: return .southWest
        case .southWest: return .northEast
        case .southEast: return .northWest
        }
    }
    
    func nextDirection(handDirection: HandDirection, includeDiagonals: Bool = false) -> Direction {
        var distance = (includeDiagonals ? 1 : 2) * (handDirection.rawValue)
        distance = (distance + self.rawValue + Direction.allCases.count) % Direction.allCases.count
        return Direction(rawValue: distance)!
    }
}

enum HandDirection: Int, CaseIterable {
    case left = -1
    case right = 1
}

protocol GridSpaceProtocol: Equatable, AnyObject {
    var id: String { get set }
    var x: Int { get set }
    var y: Int { get set }
    var printChar: String { get }
    init()
    init (_ id: String)
    func updateCoordinates(_ coords: (Int, Int))
    func getNeighborCoords(_ direction: Direction?, xMax: Int?, yMax: Int?) -> (Int, Int)?
}

extension GridSpaceProtocol {
    init(_ id: String) {
        self.init()
        self.id = id
    }

    var printChar: String { self.id }
    
    func updateCoordinates(_ coords: (Int, Int)) {
        self.x = coords.0
        self.y = coords.1
    }
    
    func getNeighborCoords(_ direction: Direction?, xMax: Int?, yMax: Int?) -> (Int, Int)? {
        guard let direction else { return nil }
        
        var coords: (Int, Int)
        
        switch(direction) {
        case .north: coords = (x, y - 1)
        case .south: coords = (x, y + 1)
        case .east: coords = (x + 1, y)
        case .west: coords = (x - 1, y)
        case .northWest: coords = (x - 1, y - 1)
        case .northEast: coords = (x + 1, y - 1)
        case .southWest: coords = (x - 1, y + 1)
        case .southEast: coords = (x + 1, y + 1)
        }
        
        if coords.0 < 0 || coords.0 > xMax ?? Int.max {
            return nil
        }
        
        if coords.1 < 0 || coords.1 > yMax ?? Int.max {
            return nil
        }
        return coords
    }

    static func ==(_ lhs: Self, _ rhs: Self) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

class GridSpace: GridSpaceProtocol, Equatable {
    var id: String = ""
    var x: Int = 0
    var y: Int = 0
    
    required init() {
        id = ""
        x = 0
        y = 0
    }
}

