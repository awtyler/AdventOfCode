//
//  Map.swift
//  Day8
//
//  Created by Aaron Tyler on 12/3/24.
//

import Foundation

enum Direction: String {
    case left = "L"
    case right = "R"
}

struct Location: Equatable {
    let name: String
    let left: String
    let right: String
    
    func getTarget(_ dir: Direction) -> String {
        switch dir {
        case .left: return left
        case .right: return right
        }
    }
    
    init(_ str: String) {
        let s1 = str.split(separator: " = ")
        let s2 = String(String(s1[1]).replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")).split(separator: ", ")
        
        name = String(s1[0])
        left = String(s2[0])
        right = String(s2[1])
    }
    
    static func ==(_ lhs: Location, _ rhs: Location) -> Bool {
        return lhs.name == rhs.name
    }
}

class Map {
    var instructions: [Direction]
    var locations: [Location]
    var locDict: Dictionary<String, Location>
    
    init(instructions: [Direction], locations: [Location]) {
        self.instructions = instructions
        self.locations = locations
        self.locDict = Self.getLocationDictionary(from: locations)
    }
    
    private static func getLocationDictionary(from locs: [Location]) -> Dictionary<String, Location> {
        var dict = Dictionary<String, Location>()
        locs.forEach { location in
            dict[location.name] = location
        }
        return dict
    }
    
    func countSteps(from inFrom: Location? = nil, to inTo: Location? = nil) -> Int {
        let from = inFrom ?? locDict["AAA"]
        let to = inTo ?? locDict["ZZZ"]
        
        var count = 0;
        var curLocation = from!
        
        var done = false
        while !done {
            let curInstruction = instructions[count % instructions.count]
            curLocation = locDict[curLocation.getTarget(curInstruction)]!
            count += 1
            
            if curLocation == to {
                done = true
            }
        }
        return count
    }
    
    func countSimultaneousSteps() -> Int {
        var curLocations: [Location] = locations.filter { $0.name.hasSuffix("A") }
        var count = 0
        var done = false
        print("LOC: ", curLocations.map({ $0.name }))
        var curInstruction: Direction // = instructions[count % instructions.count]

        while !done {
            curInstruction = instructions[count % instructions.count]
            curLocations = curLocations.map { locDict[$0.getTarget(curInstruction)]! }
            count += 1
            if count % 10_000_000 == 0 {
                print("COUNT: ", count)
            }
//            print("LOC: ", curLocations.map({ $0.name }))
            
            if curLocations.allSatisfy({ $0.name.hasSuffix("Z") }) {
//            if zcount == curLocations.count {
                done = true
            }
        }
        print("Count: ", count)
        return count
    }
}
