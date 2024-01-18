//
//  Card.swift
//  Day4
//
//  Created by Aaron Tyler on 1/15/24.
//

import Foundation

struct Card {
    let id: Int
    let winners: [Int]
    let numbers: [Int]
    var instances: Int = 1
    
    init(line: any StringProtocol) {
        let parts1 = line.split(separator: ":")
        let parts2 = parts1[1].split(separator: "|")
        
        id = Int(parts1[0].replacingOccurrences(of: "Card", with: "").trimmingCharacters(in: .whitespaces))!
        winners = parts2[0].split(separator: " ").map { Int($0)! }
        numbers = parts2[1].split(separator: " ").map { Int($0)! }
    }
    
    func calculateMatches() -> Int {
        var winningNumbers = 0
        for num in numbers {
            if winners.contains(num) {
                winningNumbers += 1
            }
        }
        return winningNumbers
    }
    
    func calculatePoints() -> Int {
        let winningNumbers = calculateMatches()
        
        var points: Int = 0
        if winningNumbers > 0 {
            points =  NSDecimalNumber(decimal: pow(2, winningNumbers - 1)).intValue
        }
        
        print("Card \(id) Points: ", winningNumbers, points)
        return points
    }
}
