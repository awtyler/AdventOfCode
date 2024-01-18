//
//  Bridge.swift
//  Day9
//
//  Created by Aaron Tyler on 11/7/23.
//

import Foundation

struct Location: Hashable {
    let x: Int
    let y: Int
    
    func getNext(direction: Direction) -> Location {
        var newx = self.x
        var newy = self.y
        switch direction {
        case .right:
            newx += 1
        case .left:
            newx -= 1
        case .up:
            newy += 1
        case .down:
            newy -= 1
        case .upRight:
            newy += 1
            newx += 1
        case .upLeft:
            newy += 1
            newx -= 1
        case .downRight:
            newy -= 1
            newx += 1
        case .downLeft:
            newy -= 1
            newx -= 1
        }
        
        return Location(x: newx, y: newy)
    }
    
    func getDistance(otherLoc: Location) -> (Int, Direction) {
        let xdist = x - otherLoc.x
        let ydist = y - otherLoc.y
        
        if abs(xdist) > abs(ydist) {
            return xdist > 0 ? (xdist, .right) : (abs(xdist), .left)
        } else if abs(xdist) < abs(ydist) {
            return ydist > 0 ? (ydist, .down) : (abs(ydist), .up)
        } else {
            if xdist > 0 && ydist > 0 {
                return (xdist, .downRight)
            } else if xdist < 0 && ydist > 0 {
                return (xdist, .upRight)
            } else if xdist > 0 && ydist < 0 {
                return (abs(xdist), .downLeft)
            } else if xdist < 0 && ydist < 0 {
                return (abs(xdist), .upLeft)
            } else if xdist == 0 && ydist == 0 {
                return (0, .upLeft)
            } else {
                print("********** ERROR! THIS SHOULDN'T HAPPEN!")
                return (0, .upLeft)
            }
        }
    }
}

class Bridge {
    var tailVisited: Set<Location> = Set()
    
    var headLocation: Location
    var knt1Location: Location
    var knt2Location: Location
    var knt3Location: Location
    var knt4Location: Location
    var knt5Location: Location
    var knt6Location: Location
    var knt7Location: Location
    var knt8Location: Location
    var tailLocation: Location
        
    init() {
        headLocation = Location(x: 0, y: 0)
        knt1Location = Location(x: 0, y: 0)
        knt2Location = Location(x: 0, y: 0)
        knt3Location = Location(x: 0, y: 0)
        knt4Location = Location(x: 0, y: 0)
        knt5Location = Location(x: 0, y: 0)
        knt6Location = Location(x: 0, y: 0)
        knt7Location = Location(x: 0, y: 0)
        knt8Location = Location(x: 0, y: 0)
        tailLocation = Location(x: 0, y: 0)
        tailVisited.insert(tailLocation)
    }
    
    func executePart1(command: Command) {
//        print("")
//        print("Command: ", command)
        for _ in 0..<command.distance {
            headLocation = headLocation.getNext(direction: command.direction)
            tailLocation = getNextLocation(front: headLocation, back: tailLocation)
            tailVisited.insert(tailLocation)
//            print("****** Locations HT: ", headLocation, tailLocation)
        }
    }
    
    func executePart2(command: Command) {
        print("----------------")
        print("Command: ", command)
        for _ in 0..<command.distance {
            headLocation = headLocation.getNext(direction: command.direction)
            knt1Location = getNextLocation(front: headLocation, back: knt1Location)
            knt2Location = getNextLocation(front: knt1Location, back: knt2Location)
            knt3Location = getNextLocation(front: knt2Location, back: knt3Location)
            knt4Location = getNextLocation(front: knt3Location, back: knt4Location)
            knt5Location = getNextLocation(front: knt4Location, back: knt5Location)
            knt6Location = getNextLocation(front: knt5Location, back: knt6Location)
            knt7Location = getNextLocation(front: knt6Location, back: knt7Location)
            knt8Location = getNextLocation(front: knt7Location, back: knt8Location)
            tailLocation = getNextLocation(front: knt8Location, back: tailLocation)
            tailVisited.insert(tailLocation)
            
//            print("*** head", headLocation)
//            print("*** knt1", knt1Location)
//            print("*** knt2", knt2Location)
//            print("*** knt3", knt3Location)
//            print("*** knt4", knt4Location)
//            print("*** knt5", knt5Location)
//            print("*** knt6", knt6Location)
//            print("*** knt7", knt7Location)
//            print("*** knt8", knt8Location)
            print("*** tail", tailLocation, tailVisited.count)
            print("")
        }
    }
    
    func getNextLocation(front: Location, back: Location) -> Location {
        let distance = front.getDistance(otherLoc: back)
//        print("*** getDistance: ", distance)
        if distance.0 > 1 {
            var newx = front.x
            var newy = front.y
            // Need to move the tail
            switch distance.1 {
            case .right:
                newx -= 1
            case .left:
                newx += 1
            case .up:
                newy += 1
            case .down:
                newy -= 1
            case .upRight:
                newy += 1
                newx += 1
            case .upLeft:
                newy += 1
                newx -= 1
            case .downRight:
                newy -= 1
                newx += 1
            case .downLeft:
                newy -= 1
                newx -= 1
            }
            return Location(x: newx, y: newy)
        }
        return back
    }
    
//    func moveTail() {
//        let distance = headLocation.getDistance(otherLoc: tailLocation)
//        if distance.0 > 1 {
//            var newx = headLocation.x
//            var newy = headLocation.y
//            // Need to move the tail
//            switch distance.1 {
//            case .right:
//                newx -= 1
//            case .left:
//                newx += 1
//            case .up:
//                newy += 1
//            case .down:
//                newy -= 1
//            }
//            tailLocation = Location(x: newx, y: newy)
//            tailVisited.insert(tailLocation)
//        }
//    }
}
