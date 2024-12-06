//
//  PageRule.swift
//  Day5
//
//  Created by Aaron Tyler on 12/5/24.
//

import Foundation

class PageRule {
    let earlier: Int
    let later: Int
    
    init(_ input: String) {
        let tokens = input.tokensToIntArray(separator: "|")
        earlier = tokens[0]
        later = tokens[1]
    }
    
    func isValid(forPageList pages: [Int]) -> Bool {
        return (pages.firstIndex(of: earlier) ?? Int.min) < (pages.firstIndex(of: later) ?? Int.max)
    }
}
