//
//  Game.swift
//  Day2
//
//  Created by Aaron Tyler on 12/6/23.
//

import Foundation

struct Game {
    let id: Int
    let pulls: [Pull]
    
    init(gameStr: String) {
        let gameSplit = gameStr.split(separator: ":").map({ String($0) })
        id = Int(gameSplit[0].replacingOccurrences(of: "Game ", with: ""))!
        
        pulls = gameSplit[1].split(separator: ";").map({ Pull(pullStr: String($0)) })
    }
    
    func isValid(maxRed: Int, maxGreen: Int, maxBlue: Int) -> Bool {
        pulls.reduce(true, { $0 && $1.isValid(maxRed: maxRed, maxGreen: maxGreen, maxBlue: maxBlue) })
    }
    
    func minPullPower() -> Int {
        let maxRed = pulls.reduce(0, { max($0, $1.red)})
        let maxGreen = pulls.reduce(0, { max($0, $1.green)})
        let maxBlue = pulls.reduce(0, { max($0, $1.blue)})

        return maxRed * maxGreen * maxBlue
    }
}

struct Pull {
    private(set) var red: Int
    private(set) var green: Int
    private(set) var blue: Int
    
    init(pullStr: String) {
        let colorCounts = pullStr.split(separator: ",").map({ String($0) })
        
        red = 0
        green = 0
        blue = 0
        
        for count in colorCounts {
            let split = count.split(separator: " ")
            let color = split[1]
            let value = Int(split[0])!
            
            if color == "red" {
                red = value
            } else if color == "blue" {
                blue = value
            } else if color == "green" {
                green = value
            }
        }
    }
    
    func isValid(maxRed: Int, maxGreen: Int, maxBlue: Int) -> Bool {
        return red <= maxRed && green <= maxGreen && blue <= maxBlue
    }
}
