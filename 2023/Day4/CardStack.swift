//
//  CardStack.swift
//  Day4
//
//  Created by Aaron Tyler on 1/15/24.
//

import Foundation

class CardStack {
    var cards: Dictionary<Int, Card>
    
    init(cards: [Card]) {
        var buildCards = Dictionary<Int, Card>()
        for card in cards {
            buildCards[card.id] = card
        }
        
        self.cards = buildCards
    }
    
    func countCards() -> Int {
        for key in cards.keys.sorted() {
            if let card = cards[key] {
                let matches = card.calculateMatches()
                
                if matches > 0 {
                    for i in 1...matches {
                        cards[key + i]?.instances += 1 * card.instances
                    }
                }
            }
        }
        
        var totalCards = 0
        for card in cards.values.sorted(by: { $0.id < $1.id}) {
            print("Card \(card.id): ", card.instances)
            totalCards += card.instances
        }
        return totalCards
    }
}
