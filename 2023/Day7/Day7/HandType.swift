//
//  Hand.swift
//  Day7
//
//  Created by Aaron Tyler on 1/18/24.
//

import Foundation

enum HandType: Int, CaseIterable {
    case fiveOfAKind = 7
    case fourOfAKind = 6
    case fullHouse = 5
    case threeOfAKind = 4
    case twoPair = 3
    case onePair = 2
    case highCard = 1
    
    var rank: Int {
        return self.rawValue
    }
    
    init(cards: [Card]) {
        let sortedCards = cards.sorted { $0.rawValue < $1.rawValue }
        self = .highCard
    }
    
    static func getHandType(cards: [Card]) -> HandType {
        for type in HandType.allCases {
            if Input.executionPart == .part1 {
                if HandType.hasType(type: type, cards: cards) {
                    return type
                }
            } else {
                if HandType.hasTypeWithJokersWild(type: type, cards: cards) {
                    return type
                }
            }
        }
        return .highCard
    }
    
    private static func hasType(type: HandType, cards: [Card]) -> Bool {
        let sorted = cards.sorted { $0.value < $1.value }
        
        switch type {
        case .fiveOfAKind:
            return sorted[0] == sorted[4]
        case .fourOfAKind:
            return sorted[0] == sorted[3] || sorted[1] == sorted[4]
        case .fullHouse:
            return (sorted[0] == sorted[2] && sorted[3] == sorted[4]) || (sorted[0] == sorted[1] && sorted[2] == sorted[4])
        case .threeOfAKind:
            return sorted[0] == sorted[2] || sorted[1] == sorted[3] || sorted[2] == sorted[4]
        case .twoPair:
            let first = sorted[0] == sorted[1]      // XX000
            let second = sorted[1] == sorted[2]     // 0XX00
            let third = sorted[2] == sorted[3]      // 00XX0
            let fourth = sorted[3] == sorted[4]     // 000XX
            
            return (first && (third || fourth)) || (second && fourth)
        case .onePair:
            let first = sorted[0] == sorted[1]      // XX000
            let second = sorted[1] == sorted[2]     // 0XX00
            let third = sorted[2] == sorted[3]      // 00XX0
            let fourth = sorted[3] == sorted[4]     // 000XX

            return first || second || third || fourth
        case .highCard:
            return true
        }
    }
    
    private static func hasTypeWithJokersWild(type: HandType, cards: [Card]) -> Bool {
        let cardString = cards.map({ $0.rawValue }).joined()
        
        for card in [
            Card.ace, Card.king, Card.queen, Card.ten, Card.nine,
            Card.eight, Card.seven, Card.six, Card.five, Card.four,
            Card.three, Card.two
        ] {
            let newCards = cardString.replacingOccurrences(of: "J", with: card.rawValue).split(separator: "").map {
                Card(rawValue: String($0))!
            }

            if HandType.hasType(type: type, cards: newCards) {
                return true
            }
        }
        
        return false
    }
}
