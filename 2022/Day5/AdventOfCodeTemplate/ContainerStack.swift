//
//  ContainerStack.swift
//  AdventOfCodeTemplate
//
//  Created by Aaron Tyler on 11/6/23.
//

import Foundation

class ContainerStack {
    let index: Int
    var containers: [String]
    
    init(index: Int, containers: [String]) {
        self.index = index
        self.containers = containers
    }
    
    func addContainer(container: String) {
        containers.append(container)
    }
    
    func removeContainer(count: Int = 1) -> String {
        return containers.removeLast()
    }
    
    func moveTo(stack: ContainerStack, count: Int, retainingOrder: Bool = false) {
        var hold: [String] = []
        for _ in 0..<count {
            let removed = self.removeContainer()
            hold.append(removed)
        }
        if retainingOrder {
            stack.containers.append(contentsOf: hold.reversed())
        } else {
            stack.containers.append(contentsOf: hold)
        }
    }
        
    func getTop() -> String? {
        return containers.last
    }
    
    var debugDescription: String {
        return "\(self.index): \(self.containers)"
    }
}
