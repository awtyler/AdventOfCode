//
//  GuardGrid.swift
//  Day6
//
//  Created by Aaron Tyler on 12/10/24.
//

import Foundation

class GuardGrid: GridProtocol {
    typealias GridSpaceType = GuardGridSpace

    var xMax: Int = 0
    var yMax: Int = 0
    var xCount: Int = 0
    var yCount: Int = 0
    var allSpaces: [GuardGridSpace] = []
    var spaces: [[GuardGridSpace]] = []

    var startSpace: GuardGridSpace!
    
    required init() {}
    
    func updateSpaces() {
        for space in allSpaces {
            if space.id == "^" {
                space.isStartSpace = true
                space.faceDirection = .north
                space.hasBeenVisited = true
                startSpace = space
                return
            }
        }
    }
    
    func moveAll() {
        var nextSpace = startSpace
        while nextSpace != nil {
            nextSpace = moveNext(from: nextSpace!)
        }
    }
    
    func moveNext(from: GuardGridSpace) -> GuardGridSpace? {
        guard let currentDirection = from.faceDirection else {
            print("No direction!")
            return nil
        }
        let nextSpace = self.getNeighbor(forSpace: from, direction: currentDirection)

        guard let nextSpace else { return nil }
        
        if nextSpace.id == "#" {
            from.faceDirection = from.faceDirection?.nextDirection(handDirection: .right)
            return moveNext(from: from)
        } else {
            nextSpace.hasBeenVisited = true
            nextSpace.faceDirection = currentDirection
            return nextSpace
        }
    }
    
    var visitedCount: Int {
        return allSpaces.reduce(0) { partialResult, space in
            if space.hasBeenVisited {
                return partialResult + 1
            } else {
                return partialResult
            }
        }
    }
}
