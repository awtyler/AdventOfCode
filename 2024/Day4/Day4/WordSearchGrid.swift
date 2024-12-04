//
//  WordSearchGrid.swift
//  Day4
//
//  Created by Aaron Tyler on 12/4/24.
//

import Foundation

class WordSearchGrid: Grid {
    
    func wordCount(atSpace space: GridSpace, word: String, startPosition: Int = 0) -> Int {
        var count = 0
        for dir in Direction.allCases {
            let wordSpaces = getNeighbor(fromStart: space, direction: dir, count: word.count, startPosition: startPosition)
            if getWord(forSpaces: wordSpaces) == word {
                count += 1
            }
        }
        return count
    }
    
    func includesXMas(atSpace space: GridSpace) -> Bool {
        let spaces1 = getNeighbor(fromStart: space, direction: .southEast, count: 3, startPosition: 1)
        let spaces2 = getNeighbor(fromStart: space, direction: .southWest, count: 3, startPosition: 1)
        
        let word1 = getWord(forSpaces: spaces1)
        let word2 = getWord(forSpaces: spaces2)

        let words = ["MAS", "SAM"]
        return words.contains(word1) && words.contains(word2)
    }
    
    func getWord(forSpaces spaces: [GridSpace]) -> String {
        let word = spaces.map(\.id).joined()
        return word
    }
    
}
