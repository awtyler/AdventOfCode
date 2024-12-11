//
//  Input.swift
//  Day6
//
//  Created by Aaron Tyler on 11/3/23.
//

import Foundation

enum ExecutionPart {
    case part1
    case part2
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
    
    static func getGridInput<T>() -> T where T : GridProtocol {
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
        let text = getTextFromFile(fileName: "SampleInput")
        return text
    }
    
    static var input_real: String {
        let text = getTextFromFile(fileName: "RealInput")
        return text
    }
    
    static func getTextFromFile(fileName file: String) -> String {
        if let filepath = Bundle.main.path(forResource: file, ofType: "txt") {
            return (try? String(contentsOfFile: filepath)) ?? "ERROR READING"
        } else {
            return "NO FILE"
        }
    }
    
}
