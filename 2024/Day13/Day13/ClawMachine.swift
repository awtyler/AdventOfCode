//
//  ClawMachine.swift
//  Day13
//
//  Created by Aaron Tyler on 12/13/24.
//

import Foundation

class ClawButton {
    let cost: Int
    let xDelta: Int
    let yDelta: Int
    
    init(_ cost: Int, _ xDelta: Int, _ yDelta: Int) {
        self.cost = cost
        self.xDelta = xDelta
        self.yDelta = yDelta
    }
    
    init(withString str: String) {
        let parts = str.split(separator: ":")
        let values = parts[1].split(separator: ",")
        
        if parts[0].hasSuffix("A") {
            cost = 3
        } else {
            cost = 1
        }
        
        let xParts = values[0].split(separator: "+")
        let yParts = values[1].split(separator: "+")
        
        xDelta = Int(xParts[1])!
        yDelta = Int(yParts[1])!
    }
}

class ClawMachine {
    
    typealias PressOption = (a: Int, b: Int, cost: Int)
    
    let aButton: ClawButton
    let bButton: ClawButton
    
    var xTarget: Int
    var yTarget: Int
    
    var pressOptions: [PressOption] = []
    var maxPresses: Int? = 100
    
    init?(withStrings str: [String]) {
        guard str[0].hasPrefix("Button A:") && str[1].hasPrefix("Button B:") && str[2].hasPrefix("Prize:") else {
            print("PARSE ERROR 1!", str)
            return nil
        }
        
        aButton = ClawButton(withString: str[0])
        bButton = ClawButton(withString: str[1])
        
        let values = str[2].replacingOccurrences(of: "Prize: ", with: "").split(separator: ",").map { Int($0.split(separator: "=")[1])! }
        xTarget = values[0]
        yTarget = values[1]
    }
    
    func adjustForPart(part: ExecutionPart) {
        if part == .part2 {
            xTarget += 10_000_000_000_000
            yTarget += 10_000_000_000_000
            maxPresses = 10000
        }
    }
    
    func isOption(aPresses: Int, bPresses: Int) -> Bool {
        let ax = aPresses * aButton.xDelta
        let ay = aPresses * aButton.yDelta
        let bx = bPresses * bButton.xDelta
        let by = bPresses * bButton.yDelta
        
        return ax + bx == xTarget && ay + by == yTarget
    }
    
    func setOptions() {
        if let maxPresses {
            for a in 0...maxPresses {
                for b in 0...maxPresses {
                    if isOption(aPresses: a, bPresses: b) {
                        let cost = (a * aButton.cost + b * bButton.cost)
                        pressOptions.append((a, b, cost))
                    }
                }
            }
        }
    }
    
    func getCheapestOption() -> PressOption? {
        var min = Int.max
        var lowest: PressOption?
        for option in pressOptions {
            if option.cost < min {
                min = option.cost
                lowest = (option.a, option.b, option.cost)
            }
        }
        return lowest
    }
}
