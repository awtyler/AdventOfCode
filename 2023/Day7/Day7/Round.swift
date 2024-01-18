//
//  Round.swift
//  Day7
//
//  Created by Aaron Tyler on 1/18/24.
//

import Foundation

struct Round: Comparable {
    let hand: [Card]
    let bid: Int
    let handType: HandType
    
    init(line: String) {
        let parts = line.split(separator: " ").map { String($0) }
        let cards = parts[0].split(separator: "").map { String($0) }
        
        var buildHand: [Card] = []
        for card in cards {
            buildHand.append(Card(rawValue: card)!)
        }

        self.hand = buildHand
        self.handType = HandType.getHandType(cards: hand)
        self.bid = Int(parts[1])!
    }

    static func < (lhs: Round, rhs: Round) -> Bool {
        if lhs.handType.rank == rhs.handType.rank {
            for i in 0..<5 {
                if lhs.hand[i].value == rhs.hand[i].value {
                    continue
                } else {
                    return lhs.hand[i].value < rhs.hand[i].value
                }
            }
        }
        return lhs.handType.rank < rhs.handType.rank
    }
}
