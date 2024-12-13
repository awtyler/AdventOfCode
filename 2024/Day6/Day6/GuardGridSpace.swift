//
//  GuardGridSpace.swift
//  Day6
//
//  Created by Aaron Tyler on 12/10/24.
//

import Foundation

class GuardGridSpace: GridSpace {
    var isStartSpace = false
    var hasBeenVisited = false
    var faceDirection: Direction?
    
    var printChar: String {
        switch faceDirection {
        case .north:
            return "^"
        case .northEast:
            return "?"
        case .east:
            return ">"
        case .southEast:
            return "?"
        case .south:
            return "v"
        case .southWest:
            return "?"
        case .west:
            return "<"
        case .northWest:
            return "?"
        case nil:
            return "!"
        }
    }
}
