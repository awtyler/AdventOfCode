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
            Text("Day 4").font(.largeTitle)
            
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
        var sum = 0
        for pairing in Input.getInput() {
            if pairing.doesFullyOverlap() {
                sum += 1
            }
        }
        
        part1Message = "Part 1 Result: \(sum)"
    }
    
    func executePart2() {
        var sum = 0
        for pairing in Input.getInput() {
            if pairing.doesPartiallyOverlap() || pairing.doesFullyOverlap() {
                sum += 1
            }
        }
        part2Message = "Part 2 Result: \(sum)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
