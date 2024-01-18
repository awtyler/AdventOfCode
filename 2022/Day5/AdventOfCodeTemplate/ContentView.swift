//
//  ContentView.swift
//  AdventOfCodeTemplate
//
//  Created by Aaron Tyler on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var part1Message: String = "Ready to Execute..."
    @State var part2Message: String = "Ready to Execute..."

    var body: some View {
        VStack {
            Text("Day 3").font(.largeTitle)
            
            Spacer()
            
            Text("Part 1").font(.largeTitle)
            Button(action: {
                executePart1()
            }, label: {
                Text("Execute Part 1")
            })
            Text(part1Message)

            Spacer().frame(maxWidth: .infinity, maxHeight: 150)

            Text("Part 2").font(.largeTitle)
            Button(action: {
                executePart2()
            }, label: {
                Text("Execute Part 2")
            })
            Text(part2Message)
            
            Spacer()
        }
        .padding()
    }
    
    func executePart1() {
        let stacks = Input.getCurrentState()
        let commands = Input.getCommands()
        
        for command in commands {
            let from = stacks.first(where: {$0.index == command.from})!
            let to = stacks.first(where: {$0.index == command.to})!
            from.moveTo(stack: to, count: command.count)
        }

        var topContainers = ""
        for stack in stacks.sorted(by: { $0.index < $1.index }) {
            topContainers = topContainers + (stack.getTop() ?? "")
        }
        
        part1Message = "Part 1 Result: \(topContainers)"
    }
    
    func executePart2() {
        let stacks = Input.getCurrentState()
        let commands = Input.getCommands()
        
        for command in commands {
            let from = stacks.first(where: {$0.index == command.from})!
            let to = stacks.first(where: {$0.index == command.to})!
            from.moveTo(stack: to, count: command.count, retainingOrder: true)
        }

        var topContainers = ""
        for stack in stacks.sorted(by: { $0.index < $1.index }) {
            topContainers = topContainers + (stack.getTop() ?? "")
        }
        
        part2Message = "Part 2 Result: \(topContainers)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
