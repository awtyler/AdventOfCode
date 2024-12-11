//
//  GridSpace.swift
//  Day4
//
//  Created by Aaron Tyler on 12/4/24.
//

import Foundation

typealias Coordinates = (x: Int, y: Int)

enum Direction: CaseIterable {
    case north
    case south
    case east
    case west
    case northWest
    case northEast
    case southWest
    case southEast
    
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
}

protocol GridSpaceProtocol: Equatable, AnyObject {
    var id: String { get set }
    var x: Int { get set }
    var y: Int { get set }
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

