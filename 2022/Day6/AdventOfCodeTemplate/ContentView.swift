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
        let terminatorSize = 4
        let input = Array(Input.input)
        var firstTerminator = 0
        for i in (terminatorSize - 1)..<input.count {
            let min = max(0, i - terminatorSize + 1)
            let max = i
            let str = String(input[min...max])
            if !str.hasDuplicates() {
                firstTerminator = i + 1
                break
            }
        }
        
        part1Message = "Part 1 Result: \(firstTerminator)"
    }
    
    func executePart2() {
        let terminatorSize = 14
        let input = Array(Input.input)
        var firstTerminator = 0
        for i in (terminatorSize - 1)..<input.count {
            let min = max(0, i - terminatorSize + 1)
            let max = i
            let str = String(input[min...max])
            if !str.hasDuplicates() {
                firstTerminator = i + 1
                break
            }
        }

        part2Message = "Part 2 Result: \(firstTerminator)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
