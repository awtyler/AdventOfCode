//
//  Input.swift
//  AdventOfCodeTemplate
//
//  Created by Aaron Tyler on 11/3/23.
//

import Foundation

enum ExecutionPart {
    case part1
    case part2
}

protocol StringInitable {
    init(withString string: String)
}

enum Input {

    static let commentChar = "#"

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
    
    static func getGridInput<T>() -> T where T : Grid {
        return T(mapString: input)
    }
    
    static func getInput<T>() -> [T] where T : StringInitable {
        let lines = input.linesToStringArray()
        
        var things: [T] = []
        
        for line in lines {
            if line.starts(with: commentChar) {
                continue
            }

            things.append(T(withString: line))
        }
        
        return things
    }
    
    static var input_sample: String {
        return (try? String(contentsOf: URL(filePath: "./SampleInput.txt"), encoding: .utf8)) ?? ""
    }
    
    static var input_real: String {
        return (try? String(contentsOf: URL(filePath: "./RealInput.txt"), encoding: .utf8)) ?? ""
    }
}
