//
//  Space.swift
//  Day10
//
//  Created by Aaron Tyler on 12/2/24.
//

import Foundation

enum Exit {     //  |   -   J   F   L   7   .
    case north  //  *       *       *
    case south  //  *           *       *
    case east   //      *       *   *
    case west   //      *   *           *
    
    var opposite: Exit {
        switch(self) {
        case .north:
            return .south
        case .south:
            return .north
        case.east:
            return .west
        case .west:
            return .east
        }
    }
}

enum SpaceShape: String, CaseIterable {
    case northSouth = "|"
    case westEast = "-"
    case northWest = "J"
    case southEast = "F"
    case northEast = "L"
    case southWest = "7"
    case start = "S"
    case ground = "."
    
    var pretty: String {
        switch self {
        case .northSouth: return "┃"
        case .westEast: return "━"
        case .northWest: return "┛"
        case .southEast: return "┏"
        case .northEast: return "┗"
        case .southWest: return "┓"
        case .start: return "⦿"
        case .ground: return "◌"
        }
    }
    
    var exits: (Exit?, Exit?) {
        let exit1: Exit?
        let exit2: Exit?
        switch self {
        case .northSouth:
            exit1 = .north
            exit2 = .south
        case .westEast:
            exit1 = .west
            exit2 = .east
        case .northWest:
            exit1 = .north
            exit2 = .west
        case .southEast:
            exit1 = .south
            exit2 = .east
        case .northEast:
            exit1 = .north
            exit2 = .east
        case .southWest:
            exit1 = .south
            exit2 = .west
        default:
            exit1 = nil
            exit2 = nil
        }
        return (exit1, exit2)
    }
}

class Space: Equatable {
    var id: String
    var shape: SpaceShape
    var x: Int = 0
    var y: Int = 0
    var inLoop: Bool = false
    var isInside: Bool = false

    var isStartSpace: Bool {
        return id == "S"
    }
    
    var exit1: Exit?
    var exit2: Exit?
    
    init(_ id: String) {
        self.id = id
        shape = SpaceShape(rawValue: id)!
        let exits = shape.exits
        exit1 = exits.0
        exit2 = exits.1
    }
    
    func hasExit(_ direction: Exit) -> Bool {
        return exit1 == direction || exit2 == direction
    }
    
    func hasExit(_ directions: [Exit]) -> Bool {
        for dir in directions {
            if hasExit(dir) {
                return true
            }
        }
        return false
    }
    
    func getOtherExit(knownExit: Exit?) -> Exit? {
        guard let knownExit else { return nil }
        if exit1 == knownExit {
            return exit2
        } else if exit2 == knownExit {
            return exit1
        } else {
            return nil
        }
    }
    
    func connects(toShape other: Space?) -> Exit? {
        guard let other, let exit1, let exit2 else { return nil }
        if other.hasExit(exit1.opposite) {
            return exit1
        } else if other.hasExit(exit2.opposite) {
            return exit2
        }
        return nil
    }
    
    func getNeighborCoords(_ direction: Exit?, xMax: Int?, yMax: Int?) -> (Int, Int)? {
        guard let direction else { return nil }
        
        var coords: (Int, Int)
        
        switch(direction) {
        case .north: coords = (x, y - 1)
        case .south: coords = (x, y + 1)
        case .east: coords = (x + 1, y)
        case .west: coords = (x - 1, y)
        }
        
        if coords.0 < 0 || coords.0 > xMax ?? Int.max {
            return nil
        }
        
        if coords.1 < 0 || coords.1 > yMax ?? Int.max {
            return nil
        }
        return coords
    }
    
    func inferShape(north: Space?, south: Space?, east: Space?, west: Space?) -> SpaceShape {
        // Assumes only one option for shape
        let N = north?.hasExit(.south) ?? false
        let S = south?.hasExit(.north) ?? false
        let E = east?.hasExit(.west) ?? false
        let W = west?.hasExit(.east) ?? false
        
        print("INFER: \(N) \(S) \(E) \(W)")
        
        if N && S { return .northSouth }
        else if E && W { return .westEast }
        else if N && W { return .northWest }
        else if S && E { return .southEast }
        else if N && E { return .northEast }
        else if S && W { return .southWest }
        else { return .ground }
    }
    
    static func ==(_ lhs: Space, _ rhs: Space) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
