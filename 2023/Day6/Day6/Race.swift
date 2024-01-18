//
//  Race.swift
//  Day6
//
//  Created by Aaron Tyler on 1/18/24.
//

import Foundation

struct Race {
    let time: Int
    let target: Int
    
    func distance(forButtonTime buttonTime: Int) -> Int {
        return (time - buttonTime) * buttonTime
    }
    
    func numberOfWaysToWin() -> Int {
        var counter = 0
        for buttonTime in 1..<time {
            if distance(forButtonTime: buttonTime) > target {
                counter += 1
            }
        }
        return counter
    }
}
