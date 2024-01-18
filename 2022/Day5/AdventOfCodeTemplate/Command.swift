//
//  File.swift
//  AdventOfCodeTemplate
//
//  Created by Aaron Tyler on 11/6/23.
//

import Foundation

struct Command {
    var from: Int
    var to: Int
    var count: Int
    
    var debugDescription: String {
        return "move \(count) from \(from) to \(to)"
    }
}
