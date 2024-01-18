//
//  File.swift
//  AdventOfCodeTemplate
//
//  Created by Aaron Tyler on 11/6/23.
//

import Foundation

class OSFile: Hashable {
    private (set) var name: String
    private (set) var size: Int
    private (set) var directory: OSDirectory
    
    init(name: String, size: Int, directory: OSDirectory) {
        self.name = name
        self.size = size
        self.directory = directory
    }
    
    func getFQN() -> String {
        return "\(directory.getFQN())/\(name)"
    }

    static func == (lhs: OSFile, rhs: OSFile) -> Bool {
        return lhs.getFQN() == rhs.getFQN()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(getFQN())
    }
}
