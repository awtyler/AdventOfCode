//
//  Parser.swift
//  Day3
//
//  Created by Aaron Tyler on 12/3/24.
//

import Foundation

class Parser {
    
    let commands: [String] = []
    
    static func parse(_ line: String, part: ExecutionPart = .part1) -> [String] {
        if part == .part1 {
            return line.matches(for: "(mul\\([0-9]{1,3},[0-9]{1,3}\\))")
        }
        return line.matches(for: "(mul\\([0-9]{1,3},[0-9]{1,3}\\))|(do\\(\\))|(don\'t\\(\\))")
        
    }
    
    static func runCommand(_ command: String) -> Int {
        let nums = command.replacingOccurrences(of: "mul(", with: "").replacingOccurrences(of: ")", with: "")
        let split = nums.split(separator: ",")
        return Int(split[0])! * Int(split[1])!
    }
    
}
