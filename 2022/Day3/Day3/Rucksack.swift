//
//  Rucksack.swift
//  Day3
//
//  Created by Aaron Tyler on 11/2/23.
//

import Foundation

class Rucksack {
    var contents: String
    var group: Int
    var compartments: ([Character],[Character]) {
        let contentsArr = Array(contents)
        let midpoint = contentsArr.count / 2
        let first = Array(contentsArr[0..<midpoint])
        let second = Array(contentsArr[midpoint..<contentsArr.count])
        return (first,second)
    }
    
    init(contents: String, group: Int) {
        self.contents = contents
        self.group = group
    }
    
    var firstCompartment: String { compartments.0.compactMap { String($0) }.joined() }
    var secondCompartment: String { compartments.1.compactMap { String($0) }.joined() }
    
    static func getPriority(item: Character) -> Int {
        let ascii = Int(item.asciiValue!)
        if Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ").compactMap({ Int($0.asciiValue!) }).contains(ascii) {
            return ascii - 64 + 26
        } else {
            return ascii - 96
        }
    }
    
    var matchingItem: Character? {
        for i in firstCompartment {
            if secondCompartment.contains(i) {
                return i
            }
        }
        return nil
    }
    
    var matchingItemPriority: Int {
        if let matchingItem {
            return Self.getPriority(item: matchingItem)
        } else {
            return 0
        }
    }
    
    static func findCommonItem(sacks: [Rucksack]) -> Character? {
        let oneSack = sacks.first!
        for item in oneSack.contents {
            var inAllSacks = true
            for sack in sacks {
                inAllSacks = inAllSacks && sack.contents.contains(item)
            }
            if inAllSacks {
                return item
            }
        }
        return nil
    }
}
