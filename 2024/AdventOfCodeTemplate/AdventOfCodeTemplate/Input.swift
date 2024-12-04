//
//  Input.swift
//  AdventOfCodeTemplate
//
//  Created by Aaron Tyler on 11/3/23.
//

import Foundation

enum Input {
    
    enum InputType {
        case sample
        case real
    }

    static var executionPart: ExecutionPart = .part1
    static var inputType: InputType = .sample
    
    static var input: String {
        if inputType == .sample {
            return input_sample
        }
        return input_real
    }
    
    static func getInput() -> [String] {
        let lines = input.linesToStringArray()

        var combined: [String] = []
        for line in lines {
            let tokens = line.tokensToStringArray()
//            <# Line Parsing Here #>
        }
        
        return combined
    }
    
    static let input_sample = """
    <# Input Sample Here #>
    """
    
    static let input_real = """
    <# Real Input Here #>
    """
}

enum ExecutionPart {
    case part1
    case part2
}
