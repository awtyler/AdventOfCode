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
        let maxSize = 100000
        var sum = 0
        let root = Input.getRootDir()
        let dirs = root.getDirectories(withMaxSize: maxSize)
        
        dirs.forEach { sum += $0.getTotalSize() }
        
        part1Message = "Part 1 Result: \(sum)"
    }
    
    func executePart2() {
        let diskSize = 70_000_000
        let neededSpace = 30_000_000
        
        let root = Input.getRootDir()
        let dirs = root.getDirectories(withMaxSize: Int.max).sorted { $0.getTotalSize() < $1.getTotalSize() }
        
        let usedSpace = root.getTotalSize()
        let availSpace = diskSize - usedSpace
        let neededToClear = neededSpace - availSpace
        
//        print("Need to clear: ", neededToClear)
        
        let size = dirs.first{ $0.getTotalSize() >= neededToClear }!.getTotalSize()
        
        part2Message = "Part 2 Result: \(size)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
