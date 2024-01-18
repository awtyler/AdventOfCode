//
//  Round.swift
//  Day2
//
//  Created by Aaron Tyler on 11/1/23.
//

import Foundation

struct Round {
    let opponentChoice: Choice
    let playerChoice: Choice
    
    let winScore = 6
    let drawScore = 3
    let loseScore = 0
    
    init(part1values values: String) {
        let choices = values.replacingOccurrences(of: "X", with: "A")
                .replacingOccurrences(of: "Y", with: "B")
                .replacingOccurrences(of: "Z", with: "C")
            .split(separator: " ", omittingEmptySubsequences: false)
        print("choices: \(choices[0]) / \(choices[1])")
        
        opponentChoice = Choice(rawValue: String(choices[0]))!
        playerChoice = Choice(rawValue: String(choices[1]))!
    }
    
    init(part2values values: String) {
        let choices = values.split(separator: " ", omittingEmptySubsequences: false)
        opponentChoice = Choice(rawValue: String(choices[0]))!
        let outcome = Outcome(rawValue: String(choices[1]))!
        playerChoice = Self.getPlayerChoice(forOutcome: outcome, opponentChoice: opponentChoice)
    }
    
    static func getPlayerChoice(forOutcome outcome: Outcome, opponentChoice: Choice) -> Choice {
        switch outcome {
        case .win:
            switch opponentChoice {
            case .rock:
                return .paper
            case .paper:
                return .scissors
            case .scissors:
                return .rock
            }
        case .lose:
            switch opponentChoice {
            case .rock:
                return .scissors
            case .paper:
                return .rock
            case .scissors:
                return .paper
            }
        case .draw:
            return opponentChoice
        }
    }
    
    func getScore() -> Int {
        var score = playerChoice.score
        if playerChoice.winsAgainst(opponentChoice) {
            score += winScore
        } else if playerChoice == opponentChoice {
            score += drawScore
        } else {
            score += loseScore
        }
        return score
    }
}

enum Outcome: String {
    case lose = "X"
    case draw = "Y"
    case win = "Z"
}

enum Choice: String {
    case rock = "A"
    case paper = "B"
    case scissors = "C"
    
    var score: Int {
        switch self {
        case .rock: return 1
        case .paper: return 2
        case .scissors: return 3
        }
    }
    
    func winsAgainst(_ choice: Choice) -> Bool {
        switch self {
        case .rock: return choice == .scissors
        case .paper: return choice == .rock
        case .scissors: return choice == .paper
        }
    }
}
