//
//  Command.swift
//  Day9
//
//  Created by Aaron Tyler on 11/7/23.
//

import Foundation

enum Direction: String {
    case right = "R"
    case left = "L"
    case up = "U"
    case down = "D"
    case upRight = "UR"
    case upLeft = "UL"
    case downRight = "DR"
    case downLeft = "DL"
}

struct Command {
    let direction: Direction
    let distance: Int
    
    init(string: String) {
        let parts = string.split(separator: " ")
        direction = Direction(rawValue: String(parts[0]))!
        distance = Int(String(parts[1]))!
    }
}
