//
//  ContentView.swift
//  Day9
//
//  Created by Aaron Tyler on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var part1Message: String = "Ready to Execute..."
    @State var part2Message: String = "Ready to Execute..."

    var body: some View {
        VStack {
            Text("Day 9").font(.largeTitle)
            
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
        let bridge = Bridge()
        let commands = Input.getCommands()
        
        for cmd in commands {
            bridge.executePart1(command: cmd)
        }
        
//        print("")
//        print("")
//        print("")
//
//        print("Tail Visited: ")
//        bridge.tailVisited.forEach { print("*** ", $0) }
        
        part1Message = "Part 1 Result: \(bridge.tailVisited.count)"
    }
    
    func executePart2() {
        let bridge = Bridge()
        let commands = Input.getCommands()
        
        for cmd in commands {
            bridge.executePart2(command: cmd)
        }
        
//        print("")
//        print("")
//        print("")
//
//        print("Tail Visited: ")
        bridge.tailVisited.forEach { print("*** ", $0) }

        part2Message = "Part 2 Result: \(bridge.tailVisited.count)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
