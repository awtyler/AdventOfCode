//
//  Extensions.swift
//  AdventOfCodeTemplate
//
//  Created by Aaron Tyler on 12/2/24.
//

import Foundation

extension String {
    static func *(_ lhs: String, _ rhs: Int) -> String {
        var str = ""
        for _ in 0..<rhs {
            str += lhs
        }
        return str
    }
    
    func linesToStringArray() -> [String] {
        return split(separator: "\n").map { String($0) }
    }
    
    func tokensToStringArray() -> [String] {
        return split(separator: " ").map { String($0) }
    }
    
    func tokensToIntArray() -> [Int] {
        return split(separator: " ").map { Int(String($0))! }
    }
}
