//
//  Card.swift
//  Day7
//
//  Created by Aaron Tyler on 1/18/24.
//

import Foundation

enum Card: String, CaseIterable {
    case ace = "A"
    case king = "K"
    case queen = "Q"
    case jack = "J"
    case ten = "T"
    case nine = "9"
    case eight = "8"
    case seven = "7"
    case six = "6"
    case five = "5"
    case four = "4"
    case three = "3"
    case two = "2"

    var value: Int {
        switch self {
        case .ace: return 13
        case .king: return 12
        case .queen: return 11
        case .jack:
            if Input.executionPart == .part1 {
                return 10
            } else {
                return 0
            }
        case .ten: return 9
        case .nine: return 8
        case .eight: return 7
        case .seven: return 6
        case .six: return 5
        case .five: return 4
        case .four: return 3
        case .three: return 2
        case .two: return 1
        }
    }
}
