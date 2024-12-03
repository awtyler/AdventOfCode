//
//  Extensions.swift
//  Day3
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
    
    func matches(for regex: String) -> [String] {

        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
